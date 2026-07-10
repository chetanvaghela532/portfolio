// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/data/models/skill_model.dart';
import 'package:meu_curriculo_flutter/l10n/arb/app_localizations.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/search_target.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/section_header.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/tech_chip.dart';

class SkillsSection extends StatelessWidget {
  final List<SkillModel> skills;

  const SkillsSection({required this.skills, super.key});

  @override
  Widget build(final BuildContext context) {
    final mobileSkills = skills
        .where((final s) => s.type == SkillType.mobile)
        .toList();
    final webSkills = skills
        .where((final s) => s.type == SkillType.web)
        .toList();
    final toolsSkills = skills
        .where((final s) => s.type == SkillType.tools)
        .toList();

    return SearchTarget(
      id: 'skills',
      ring: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            marker: '// 01',
            title: AppLocalizations.of(context)!.sectionSkills,
          ),
          const SizedBox(height: AppTokens.space32),
          _buildCategory(
            context,
            FontAwesomeIcons.mobileScreenButton,
            'MOBILE (CORE)',
            mobileSkills,
            0,
          ),
          const SizedBox(height: AppTokens.space32),
          _buildCategory(
            context,
            FontAwesomeIcons.server,
            'WEB, BACKEND & DATA',
            webSkills,
            200,
          ),
          const SizedBox(height: AppTokens.space32),
          _buildCategory(
            context,
            FontAwesomeIcons.screwdriverWrench,
            'TOOLS & DEVOPS',
            toolsSkills,
            400,
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(
    final BuildContext context,
    final FaIconData icon,
    final String title,
    final List<SkillModel> items,
    final int delayMs,
  ) {
    final tokens = AppColorTokens.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FaIcon(icon, size: 15, color: tokens.accent),
            const SizedBox(width: AppTokens.space8),
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: tokens.muted,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ).animate().fadeIn(delay: delayMs.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: AppTokens.space16),
        Wrap(
          spacing: AppTokens.space12,
          runSpacing: AppTokens.space12,
          children: items
              .map(
                (final skill) =>
                    TechChip(label: skill.name, isHighlight: skill.isHighlight),
              )
              .toList(),
        ).animate(delay: delayMs.ms).fadeIn(duration: AppTokens.motionSlow),
      ],
    );
  }
}
