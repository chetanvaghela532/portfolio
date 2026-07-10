// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/data/models/experience_model.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/highlight_text.dart';

class ExperienceCard extends StatefulWidget {
  final ExperienceModel experience;

  const ExperienceCard({required this.experience, super.key});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final tokens = AppColorTokens.of(context);
    final exp = widget.experience;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      // No Transform on hover: translating the card composites its text onto a
      // sub-pixel layer, which renders blurry (notably on 125%/150% displays).
      // Hover feedback comes from the border + glow instead, which stays crisp.
      child: AnimatedContainer(
        duration: AppTokens.motionFast,
        curve: AppTokens.motionCurve,
        margin: const EdgeInsets.only(bottom: AppTokens.space24, left: 16),
        decoration: BoxDecoration(
          color: tokens.surface,
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          // Uniform border only — a non-uniform Border cannot have a
          // borderRadius. The left accent is drawn separately below.
          border: Border.all(
            color: _isHovered
                ? tokens.primary.withValues(alpha: 0.7)
                : tokens.border,
          ),
          boxShadow: _isHovered
              ? tokens.glow(tokens.primary, intensity: 0.18, blur: 22)
              : tokens.restShadow,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          child: Stack(
            children: [
              // Left accent stripe
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: AnimatedContainer(
                  duration: AppTokens.motionFast,
                  width: 3,
                  color: _isHovered
                      ? tokens.primary
                      : tokens.accent.withValues(alpha: 0.6),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppTokens.space24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: HighlightText(
                            exp.role,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: tokens.text,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppTokens.space12),
                        _PeriodBadge(
                          period: exp.period,
                          isCurrent: exp.isCurrent,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTokens.space4),
                    HighlightText(
                      exp.company,
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: theme.textTheme.bodyMedium,
                        color: tokens.accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppTokens.space12),
                    HighlightText(
                      exp.description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: tokens.muted,
                        height: 1.55,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PeriodBadge extends StatelessWidget {
  final String period;
  final bool isCurrent;

  const _PeriodBadge({required this.period, required this.isCurrent});

  @override
  Widget build(final BuildContext context) {
    final tokens = AppColorTokens.of(context);
    final color = isCurrent ? AppPalette.green : tokens.primary;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTokens.space8,
        vertical: AppTokens.space4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppTokens.radiusSm - 2),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isCurrent) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: AppTokens.space4 + 2),
          ],
          Text(
            period,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
