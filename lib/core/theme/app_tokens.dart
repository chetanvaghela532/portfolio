// Flutter imports:
import 'package:flutter/material.dart';

/// Design tokens for the cyberpunk / tech portfolio.
///
/// Centralizes color, spacing, radius, motion and elevation so every widget
/// reads from a single source of truth instead of hardcoding values.
/// See [AppColorTokens] for brightness-aware colors resolved from context.
class AppTokens {
  const AppTokens._();

  // --- Fonts (loaded via google_fonts) ---
  static const String sansFont = 'Plus Jakarta Sans';
  static const String monoFont = 'JetBrains Mono';

  // --- Spacing scale (4pt grid) ---
  static const double space2 = 2;
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space40 = 40;
  static const double space48 = 48;
  static const double space64 = 64;
  static const double space80 = 80;
  static const double space100 = 100;

  // --- Radius scale ---
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 20;
  static const double radiusPill = 999;

  // --- Content ---
  static const double maxContentWidth = 1200;

  // --- Responsive breakpoints ---
  static const double bpMobile = 700;
  static const double bpTablet = 1100;

  // --- Motion ---
  static const Duration motionFast = Duration(milliseconds: 200);
  static const Duration motionMedium = Duration(milliseconds: 300);
  static const Duration motionSlow = Duration(milliseconds: 500);
  static const Curve motionCurve = Curves.easeOutCubic;
}

/// Raw brand palette. Prefer [AppColorTokens] (context-aware) inside widgets.
class AppPalette {
  const AppPalette._();

  // Neon accents
  static const Color neonBlue = Color(0xFF3B82F6);
  static const Color neonBlueBright = Color(0xFF60A5FA);
  static const Color cta = Color(0xFF2563EB);
  static const Color cyan = Color(0xFF22D3EE);
  static const Color magenta = Color(0xFFE879F9);
  static const Color green = Color(0xFF34D399);

  // Dark surfaces (cyberpunk base)
  static const Color bgDark = Color(0xFF0B1120);
  static const Color surfaceDark = Color(0xFF111A2E);
  static const Color surfaceDarkElevated = Color(0xFF16213D);
  static const Color textDark = Color(0xFFF1F5F9);
  static const Color mutedDark = Color(0xFF94A3B8);
  static const Color borderDark = Color(0x1FFFFFFF); // white @ 12%

  // Light surfaces (kept high-contrast for accessibility)
  static const Color bgLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color textLight = Color(0xFF0F172A);
  static const Color mutedLight = Color(0xFF475569);
  static const Color borderLight = Color(0xFFE2E8F0);
}

/// Brightness-aware color accessors and reusable effects.
///
/// Usage: `final c = AppColorTokens.of(context);` then `c.surface`, `c.glow(...)`.
class AppColorTokens {
  final Brightness brightness;

  const AppColorTokens(this.brightness);

  factory AppColorTokens.of(final BuildContext context) =>
      AppColorTokens(Theme.of(context).brightness);

  bool get isDark => brightness == Brightness.dark;

  Color get background => isDark ? AppPalette.bgDark : AppPalette.bgLight;
  Color get surface =>
      isDark ? AppPalette.surfaceDark : AppPalette.surfaceLight;
  Color get surfaceElevated =>
      isDark ? AppPalette.surfaceDarkElevated : AppPalette.surfaceLight;
  Color get text => isDark ? AppPalette.textDark : AppPalette.textLight;
  Color get muted => isDark ? AppPalette.mutedDark : AppPalette.mutedLight;
  Color get border => isDark ? AppPalette.borderDark : AppPalette.borderLight;
  Color get primary => isDark ? AppPalette.neonBlue : AppPalette.cta;
  Color get accent => AppPalette.cyan;

  /// Neon glow shadow for cards / focused elements.
  List<BoxShadow> glow(
    final Color color, {
    final double intensity = 0.35,
    final double blur = 24,
  }) {
    return [
      BoxShadow(
        color: color.withValues(alpha: intensity),
        blurRadius: blur,
        spreadRadius: 0,
        offset: const Offset(0, 8),
      ),
    ];
  }

  /// Subtle resting elevation used by cards at rest.
  List<BoxShadow> get restShadow => [
    BoxShadow(
      color: isDark
          ? Colors.black.withValues(alpha: 0.4)
          : Colors.black.withValues(alpha: 0.06),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
  ];

  /// Signature diagonal accent gradient (blue -> cyan).
  LinearGradient get accentGradient => const LinearGradient(
    colors: [AppPalette.neonBlue, AppPalette.cyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
