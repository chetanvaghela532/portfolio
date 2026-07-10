// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/core/utils/app_utils.dart';
import 'package:meu_curriculo_flutter/data/models/certificate_model.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/highlight_text.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/tech_chip.dart';

class CertificateCard extends StatefulWidget {
  final CertificateModel certificate;

  const CertificateCard({required this.certificate, super.key});

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  final ValueNotifier<Offset> _mousePos = ValueNotifier(Offset.zero);
  final ValueNotifier<bool> _isHovered = ValueNotifier(false);
  bool _isExpanded = false;

  @override
  void dispose() {
    _mousePos.dispose();
    _isHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final tokens = AppColorTokens.of(context);
    final cert = widget.certificate;
    final hasLink = cert.credentialUrl.isNotEmpty;
    final canExpand = cert.description.length > 110;

    // Excluded from the page-wide SelectionArea so the whole card shows the
    // hand cursor (no text I-beam over the card's text).
    return SelectionContainer.disabled(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _isHovered.value = true,
        onExit: (_) {
          _isHovered.value = false;
          _mousePos.value = Offset.zero;
        },
        onHover: (final details) {
          final renderObject = context.findRenderObject();
          if (renderObject is! RenderBox || !renderObject.attached) {
            return;
          }

          final renderBox = renderObject;
          final size = renderBox.size;
          final center = Offset(size.width / 2, size.height / 2);
          _mousePos.value = details.localPosition - center;
        },
        child: AnimatedBuilder(
          animation: Listenable.merge([_mousePos, _isHovered]),
          builder: (final context, final child) {
            final hovered = _isHovered.value;
            final mouse = _mousePos.value;

            final transform = Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(hovered ? 0.0009 * mouse.dy : 0)
              ..rotateY(hovered ? -0.0009 * mouse.dx : 0);

            return Transform(
              transform: transform,
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(right: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: tokens.surface,
                  borderRadius: BorderRadius.circular(AppTokens.radiusLg),
                  border: Border.all(
                    color: hovered
                        ? tokens.primary.withValues(alpha: 0.7)
                        : tokens.border,
                  ),
                  boxShadow: hovered
                      ? tokens.glow(tokens.primary, blur: 22)
                      : tokens.restShadow,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppTokens.space20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(AppTokens.space8),
                                decoration: BoxDecoration(
                                  color: tokens.primary.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(
                                    AppTokens.radiusSm,
                                  ),
                                ),
                                child: Icon(
                                  Icons.workspace_premium_outlined,
                                  color: tokens.primary,
                                  size: 22,
                                ),
                              ),
                              if (hasLink)
                                Icon(
                                  Icons.open_in_new_rounded,
                                  size: 18,
                                  color: tokens.muted,
                                ),
                            ],
                          ),
                          const SizedBox(height: AppTokens.space16),
                          HighlightText(
                            cert.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              color: tokens.text,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppTokens.space8 - 2),
                          Text(
                            '${cert.issuer}  •  ${cert.date}',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: tokens.accent,
                            ),
                          ),
                          const SizedBox(height: AppTokens.space12),
                          HighlightText(
                            cert.description,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: tokens.muted,
                              height: 1.45,
                            ),
                            maxLines: _isExpanded ? null : 4,
                            overflow: _isExpanded
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                          ),
                          if (canExpand) ...[
                            const SizedBox(height: AppTokens.space8),
                            TextButton(
                              onPressed: () {
                                setState(() => _isExpanded = !_isExpanded);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                foregroundColor: tokens.primary,
                              ),
                              child: Text(
                                _isExpanded ? 'Show less' : 'Show more',
                                style: GoogleFonts.jetBrainsMono(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                          const SizedBox(height: AppTokens.space16),
                          if (cert.language.isNotEmpty ||
                              cert.framework.isNotEmpty)
                            Wrap(
                              spacing: AppTokens.space8,
                              runSpacing: AppTokens.space8,
                              children: [
                                if (cert.language.isNotEmpty)
                                  TechChip(label: cert.language),
                                if (cert.framework.isNotEmpty)
                                  TechChip(
                                    label: cert.framework,
                                    isHighlight: true,
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    if (hasLink)
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                              AppTokens.radiusLg,
                            ),
                            onTap: () => AppUtils.launchURL(
                              cert.credentialUrl,
                              context: context,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
