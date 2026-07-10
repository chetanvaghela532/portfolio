import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/l10n/arb/app_localizations.dart';
import 'package:meu_curriculo_flutter/presentation/controllers/portfolio_controller.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/background_pattern.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/organisms/certificates_section.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/organisms/experience_section.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/organisms/glass_header.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/organisms/hero_section.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/organisms/info_cards_section.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/organisms/projects_section.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/organisms/skills_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildFooter(
    final BuildContext context,
    final PortfolioController controller,
  ) {
    final tokens = AppColorTokens.of(context);
    final l = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(width: 32, height: 1, color: tokens.border),
        const SizedBox(height: AppTokens.space24),
        Column(
          children: [
            Text(
              '// built for remote Flutter roles',
              style: GoogleFonts.jetBrainsMono(
                color: tokens.muted,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: AppTokens.space8),
            Text(
              '© ${DateTime.now().year} Chetan Vaghela',
              style: GoogleFonts.jetBrainsMono(
                color: tokens.muted.withValues(alpha: 0.7),
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTokens.space8),
        TextButton.icon(
          onPressed: () => controller.scrollController.animateTo(
            0,
            duration: AppTokens.motionSlow,
            curve: AppTokens.motionCurve,
          ),
          style: TextButton.styleFrom(foregroundColor: tokens.muted),
          icon: const Icon(Icons.arrow_upward_rounded, size: 14),
          label: Text(
            l.backToTop,
            style: GoogleFonts.jetBrainsMono(fontSize: 12),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(final BuildContext context) {
    final controller = context.watch<PortfolioController>();
    final isMobile = MediaQuery.of(context).size.width < AppTokens.bpMobile;
    final heroGap = isMobile ? 56.0 : 120.0;
    final sectionGap = isMobile ? 56.0 : 100.0;
    final footerGap = isMobile ? 80.0 : 140.0;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundPattern(
            child: controller.errorMessage != null
                ? Center(
                    child: Text(
                      controller.errorMessage!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                : SingleChildScrollView(
                    controller: controller.scrollController,
                    padding: EdgeInsets.only(
                      top: isMobile ? 88 : 100,
                      bottom: isMobile ? 40 : 60,
                    ),
                    child: SelectionArea(
                      child: Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 24,
                          ),
                          child: controller.isLoading
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 120),
                                  child: CircularProgressIndicator(),
                                )
                              : Column(
                                  children: [
                                    HeroSection(key: controller.heroKey),
                                    SizedBox(height: heroGap),
                                    SkillsSection(
                                      key: controller.skillsKey,
                                      skills: controller.skills,
                                    ),
                                    SizedBox(height: sectionGap),
                                    ExperienceSection(
                                      key: controller.experienceKey,
                                      experiences: controller.experiences,
                                    ),
                                    SizedBox(height: sectionGap),
                                    ProjectsSection(
                                      key: controller.projectsKey,
                                      projects: controller.projects,
                                    ),
                                    SizedBox(height: sectionGap),
                                    CertificatesSection(
                                      key: controller.certificatesKey,
                                      certificates: controller.certificates,
                                    ),
                                    SizedBox(height: sectionGap),
                                    InfoCardsSection(
                                      key: controller.highlightsKey,
                                      title: 'Highlights',
                                      marker: '// 05',
                                      targetPrefix: 'highlight',
                                      items: controller.highlights,
                                    ),
                                    SizedBox(height: sectionGap),
                                    InfoCardsSection(
                                      key: controller.educationKey,
                                      title: 'Education',
                                      marker: '// 06',
                                      targetPrefix: 'education',
                                      items: controller.education,
                                    ),
                                    SizedBox(height: footerGap),
                                    _buildFooter(context, controller),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
          ),
          const Positioned(top: 0, left: 0, right: 0, child: GlassHeader()),
        ],
      ),
    );
  }
}
