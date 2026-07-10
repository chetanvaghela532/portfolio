// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/highlight_text.dart';

/// Tech tag chip. Highlighted chips get a neon-filled treatment with glow;
/// regular chips are outlined "ghost" pills that read well on both themes.
class TechChip extends StatelessWidget {
  final String label;
  final bool isHighlight;

  const TechChip({required this.label, super.key, this.isHighlight = false});

  @override
  Widget build(final BuildContext context) {
    final tokens = AppColorTokens.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTokens.space12,
        vertical: AppTokens.space8 - 1,
      ),
      decoration: BoxDecoration(
        color: isHighlight
            ? tokens.primary.withValues(alpha: tokens.isDark ? 0.18 : 0.12)
            : tokens.surfaceElevated,
        borderRadius: BorderRadius.circular(AppTokens.radiusPill),
        border: Border.all(
          color: isHighlight
              ? tokens.primary.withValues(alpha: 0.7)
              : tokens.border,
        ),
        boxShadow: isHighlight
            ? tokens.glow(tokens.primary, intensity: 0.22, blur: 12)
            : null,
      ),
      child: HighlightText(
        label,
        style: GoogleFonts.jetBrainsMono(
          fontSize: 12,
          height: 1.1,
          color: isHighlight ? tokens.primary : tokens.muted,
          fontWeight: isHighlight ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
    );
  }
}
