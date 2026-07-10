// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/constants/app_constants.dart';
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/core/utils/app_utils.dart';
import 'package:meu_curriculo_flutter/l10n/arb/app_localizations.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/highlight_text.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/search_target.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/social_button.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/tech_marquee.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/typewriter_text.dart';

/// Minimalist, resume-style hero: an availability badge, a bold name, an
/// animated role line, a concise bio, clear CTAs, and a tidy tech marquee
/// (replacing the old scattered icons).
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(final BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppTokens.bpMobile;

    final content = _HeroContent(
      isMobile: isMobile,
      onContact: () =>
          AppUtils.launchURL(AppStrings.emailUrl, context: context),
      onDownload: () => AppUtils.launchURL(
        AppUtils.assetUrl(AppAssets.cvPtBr),
        context: context,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const _Avatar(size: 128),
                    const SizedBox(height: AppTokens.space24),
                    content,
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 3, child: content),
                    const SizedBox(width: AppTokens.space64),
                    const _Avatar(size: 300),
                  ],
                ),
        ),
        SizedBox(height: isMobile ? AppTokens.space40 : AppTokens.space80),
        const TechMarquee().animate().fadeIn(
          delay: 450.ms,
          duration: AppTokens.motionSlow,
        ),
      ],
    );
  }
}

class _HeroContent extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onContact;
  final VoidCallback onDownload;

  const _HeroContent({
    required this.isMobile,
    required this.onContact,
    required this.onDownload,
  });

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final tokens = AppColorTokens.of(context);
    final l = AppLocalizations.of(context)!;
    final cross = isMobile
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final align = isMobile ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment: cross,
      mainAxisSize: MainAxisSize.min,
      children: [
        const _AvailabilityBadge().animate().fadeIn(duration: 500.ms),
        const SizedBox(height: AppTokens.space20),
        Text(
          l.heroGreeting,
          style: GoogleFonts.jetBrainsMono(
            color: tokens.accent,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: AppTokens.space12),
        Text(
              AppStrings.portfolioTitle,
              textAlign: align,
              style: theme.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: isMobile ? 44 : 68,
                height: 1.02,
                letterSpacing: -1.5,
                color: tokens.text,
              ),
            )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: AppTokens.space12),
        // Animated role line
        TypewriterText(
          textAlign: align,
          texts: const [
            'Mobile Developer (Flutter)',
            'Fullstack Engineer',
            'Clean Architecture',
            'Node.js & TypeScript',
          ],
          style: GoogleFonts.jetBrainsMono(
            fontSize: isMobile ? 18 : 24,
            fontWeight: FontWeight.w600,
            color: tokens.primary,
          ),
        ).animate().fadeIn(delay: 400.ms),
        const SizedBox(height: AppTokens.space24),
        SearchTarget(
          id: 'hero',
          ring: false,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 540),
            child: HighlightText(
              AppStrings.aboutMe,
              textAlign: align,
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.7,
                fontSize: 16,
                color: tokens.muted,
              ),
            ),
          ),
        ).animate().fadeIn(delay: 500.ms),
        const SizedBox(height: AppTokens.space32),
        // CTAs
        Wrap(
          spacing: AppTokens.space16,
          runSpacing: AppTokens.space12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: onContact,
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: Text(l.heroContact),
            ),
            OutlinedButton.icon(
              onPressed: onDownload,
              icon: const Icon(Icons.download_rounded, size: 18),
              label: Text(l.downloadCv),
            ),
          ],
        ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: AppTokens.space24),
        // Social links
        Wrap(
          spacing: AppTokens.space12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: const [
            SocialButton(
              icon: FontAwesomeIcons.linkedin,
              url: AppStrings.linkedInUrl,
              tooltip: 'LinkedIn',
            ),
            SocialButton(
              icon: FontAwesomeIcons.github,
              url: AppStrings.gitHubUrl,
              tooltip: 'GitHub',
            ),
            SocialButton(
              icon: FontAwesomeIcons.whatsapp,
              url: AppStrings.whatsappUrl,
              tooltip: 'WhatsApp',
            ),
            SocialButton(
              icon: FontAwesomeIcons.envelope,
              url: AppStrings.emailUrl,
              tooltip: 'E-mail',
            ),
          ],
        ).animate().fadeIn(delay: 700.ms),
      ],
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {
  const _AvailabilityBadge();

  @override
  Widget build(final BuildContext context) {
    final tokens = AppColorTokens.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTokens.space12,
        vertical: AppTokens.space8 - 2,
      ),
      decoration: BoxDecoration(
        color: AppPalette.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTokens.radiusPill),
        border: Border.all(color: AppPalette.green.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppPalette.green,
                  shape: BoxShape.circle,
                ),
              )
              .animate(onPlay: (final c) => c.repeat(reverse: true))
              .fadeIn(duration: 900.ms)
              .then()
              .fade(begin: 1, end: 0.3, duration: 900.ms),
          const SizedBox(width: AppTokens.space8),
          Flexible(
            child: Text(
              AppLocalizations.of(context)!.heroAvailable,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: tokens.isDark
                    ? AppPalette.green
                    : const Color(0xFF167C4A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final double size;

  const _Avatar({required this.size});

  @override
  Widget build(final BuildContext context) {
    final tokens = AppColorTokens.of(context);

    return Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                tokens.primary.withValues(alpha: 0.9),
                AppPalette.cyan.withValues(alpha: 0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: tokens.primary.withValues(alpha: 0.25),
                blurRadius: 32,
                spreadRadius: -6,
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: tokens.background, width: 3),
            ),
            child: const ClipOval(
              child: Image(
                image: AssetImage(AppAssets.profileImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 700.ms)
        .scale(
          begin: const Offset(0.85, 0.85),
          end: const Offset(1, 1),
          curve: Curves.easeOutBack,
          duration: 700.ms,
        );
  }
}
