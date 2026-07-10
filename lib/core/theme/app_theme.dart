// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';

/// Central theme for the cyberpunk / tech portfolio.
///
/// Dark is the primary experience (neon-on-deep-navy); light is kept
/// high-contrast and accessible. Colors, radius and spacing come from
/// [AppTokens] / [AppPalette] so nothing is hardcoded per-widget.
class AppTheme {
  const AppTheme._();

  static ThemeData get darkTheme => _buildTheme(Brightness.dark);
  static ThemeData get lightTheme => _buildTheme(Brightness.light);

  static ThemeData _buildTheme(final Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final tokens = AppColorTokens(brightness);

    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppPalette.neonBlue,
          brightness: brightness,
        ).copyWith(
          primary: tokens.primary,
          secondary: AppPalette.cyan,
          surface: tokens.surface,
          onSurface: tokens.text,
          outlineVariant: tokens.border,
        );

    final baseTextTheme = GoogleFonts.plusJakartaSansTextTheme(
      ThemeData(brightness: brightness).textTheme,
    ).apply(bodyColor: tokens.text, displayColor: tokens.text);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: tokens.background,
      colorScheme: colorScheme,
      textTheme: baseTextTheme.copyWith(
        // Display/headline stay geometric-bold; labels lean mono for the HUD feel.
        labelLarge: GoogleFonts.jetBrainsMono(
          textStyle: baseTextTheme.labelLarge,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: tokens.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          side: BorderSide(color: tokens.border),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: tokens.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: AppTokens.space24,
            vertical: AppTokens.space16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          ),
          elevation: isDark ? 0 : 2,
          shadowColor: tokens.primary.withValues(alpha: 0.5),
          textStyle: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: tokens.primary,
          side: BorderSide(color: tokens.primary.withValues(alpha: 0.5)),
          padding: const EdgeInsets.symmetric(
            horizontal: AppTokens.space24,
            vertical: AppTokens.space16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: tokens.primary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark
            ? Colors.white.withValues(alpha: 0.04)
            : Colors.black.withValues(alpha: 0.03),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppTokens.space16,
          vertical: AppTokens.space16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: BorderSide(color: tokens.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: BorderSide(color: tokens.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          borderSide: BorderSide(color: tokens.primary, width: 1.6),
        ),
        labelStyle: TextStyle(color: tokens.muted),
        hintStyle: TextStyle(color: tokens.muted),
      ),
      dividerTheme: DividerThemeData(
        color: tokens.border,
        thickness: 1,
        space: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: tokens.surfaceElevated,
        contentTextStyle: TextStyle(color: tokens.text),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          side: BorderSide(color: tokens.border),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: tokens.surfaceElevated,
        side: BorderSide(color: tokens.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTokens.radiusPill),
        ),
      ),
      iconTheme: IconThemeData(color: tokens.text),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: tokens.surfaceElevated,
          borderRadius: BorderRadius.circular(AppTokens.radiusSm),
          border: Border.all(color: tokens.border),
        ),
        textStyle: TextStyle(color: tokens.text, fontSize: 12),
      ),
    );
  }
}
