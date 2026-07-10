// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';

/// Consistent cyberpunk section header used across every landing organism.
///
/// Renders a monospaced `// index` marker, the title, a short neon accent
/// rule, and an optional trailing action (e.g. "Ver todos no GitHub").
class SectionHeader extends StatelessWidget {
  final String title;

  /// Monospaced marker shown above the title, e.g. `// 01`.
  final String marker;

  /// Optional trailing widget aligned to the end of the title row.
  final Widget? trailing;

  const SectionHeader({
    required this.title,
    required this.marker,
    super.key,
    this.trailing,
  });

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final tokens = AppColorTokens.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          marker,
          style: GoogleFonts.jetBrainsMono(
            color: tokens.accent,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: AppTokens.space8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: tokens.text,
                ),
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: AppTokens.space16),
              trailing!,
            ],
          ],
        ),
        const SizedBox(height: AppTokens.space12),
        // Neon accent rule
        Container(
          height: 3,
          width: 56,
          decoration: BoxDecoration(
            gradient: tokens.accentGradient,
            borderRadius: BorderRadius.circular(AppTokens.radiusPill),
            boxShadow: tokens.glow(tokens.primary, intensity: 0.5, blur: 12),
          ),
        ).animate().scaleX(
          begin: 0,
          end: 1,
          alignment: Alignment.centerLeft,
          duration: AppTokens.motionSlow,
          curve: Curves.easeOut,
        ),
      ],
    );
  }
}
