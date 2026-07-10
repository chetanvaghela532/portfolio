// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/core/utils/app_utils.dart';
import 'package:meu_curriculo_flutter/data/models/project_model.dart';
import 'package:meu_curriculo_flutter/l10n/arb/app_localizations.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/highlight_text.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/tech_chip.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({required this.project, super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  // ValueNotifiers avoid rebuilding the whole widget on pointer move.
  final ValueNotifier<Offset> _mousePos = ValueNotifier(Offset.zero);
  final ValueNotifier<bool> _isHovered = ValueNotifier(false);

  @override
  void dispose() {
    _mousePos.dispose();
    _isHovered.dispose();
    super.dispose();
  }

  Future<void> _openRepo() =>
      AppUtils.launchURL(widget.project.repoUrl, context: context);

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final tokens = AppColorTokens.of(context);
    final hasLive =
        widget.project.liveUrl != null && widget.project.liveUrl!.isNotEmpty;

    // SelectionContainer.disabled keeps the card out of the page-wide
    // SelectionArea, so hovering it never turns into the text I-beam — the
    // whole clickable card shows the hand cursor instead.
    return SelectionContainer.disabled(
      child: Semantics(
        button: true,
        label: 'Projeto ${widget.project.title}',
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
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateX(hovered ? 0.0009 * mouse.dy : 0)
                ..rotateY(hovered ? -0.0009 * mouse.dx : 0);

              return Transform(
                transform: transform,
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: tokens.surface,
                    borderRadius: BorderRadius.circular(AppTokens.radiusXl),
                    border: Border.all(
                      color: hovered
                          ? tokens.primary.withValues(alpha: 0.7)
                          : tokens.border,
                    ),
                    boxShadow: hovered
                        ? tokens.glow(tokens.primary, blur: 30)
                        : tokens.restShadow,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppTokens.space20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(
                                    AppTokens.space8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: tokens.primary.withValues(
                                      alpha: 0.12,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      AppTokens.radiusSm,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.folder_open_rounded,
                                    size: 20,
                                    color: tokens.primary,
                                  ),
                                ),
                                Icon(
                                  Icons.north_east_rounded,
                                  size: 13,
                                  color: tokens.muted,
                                ),
                              ],
                            ),
                            const SizedBox(height: AppTokens.space16),
                            HighlightText(
                              widget.project.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: tokens.text,
                              ),
                            ),
                            const SizedBox(height: AppTokens.space8),
                            Flexible(
                              child: HighlightText(
                                widget.project.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  height: 1.45,
                                  fontSize: 13,
                                  color: tokens.muted,
                                ),
                              ),
                            ),
                            const SizedBox(height: AppTokens.space12),
                            Wrap(
                              spacing: AppTokens.space8 - 2,
                              runSpacing: AppTokens.space8 - 2,
                              children: widget.project.techStack
                                  .take(3)
                                  .map((final t) => TechChip(label: t))
                                  .toList(),
                            ),
                            const SizedBox(height: AppTokens.space12),
                          ],
                        ),
                      ),

                      // Clickable overlay -> repo
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                              AppTokens.radiusXl,
                            ),
                            onTap: _openRepo,
                            mouseCursor: SystemMouseCursors.click,
                          ),
                        ),
                      ),

                      // Live demo button sits above the overlay
                      if (hasLive)
                        Positioned(
                          left: AppTokens.space20,
                          right: AppTokens.space20,
                          bottom: AppTokens.space20,
                          child: ElevatedButton.icon(
                            onPressed: () => AppUtils.launchURL(
                              widget.project.liveUrl!,
                              context: context,
                            ),
                            icon: const Icon(
                              Icons.north_east_rounded,
                              size: 14,
                            ),
                            label: Text(AppLocalizations.of(context)!.viewDemo),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
