// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_animate/flutter_animate.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/constants/app_constants.dart';
import 'package:meu_curriculo_flutter/core/utils/app_utils.dart';
import 'package:meu_curriculo_flutter/data/models/project_model.dart';
import 'package:meu_curriculo_flutter/l10n/arb/app_localizations.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/search_target.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/section_header.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/molecules/project_card.dart';

class ProjectsSection extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectsSection({required this.projects, super.key});

  @override
  Widget build(final BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          marker: '// 03',
          title: l.sectionProjects,
          trailing: TextButton.icon(
            onPressed: () => AppUtils.launchURL(
              AppStrings.gitHubRepositoriesUrl,
              context: context,
            ),
            icon: Text(l.viewAll),
            label: const Icon(Icons.arrow_forward, size: 16),
          ),
        ),
        const SizedBox(height: 24),

        LayoutBuilder(
          builder: (final context, final constraints) {
            // Lógica responsiva para o Grid
            var crossAxisCount = 1;
            if (constraints.maxWidth > 1100) {
              crossAxisCount = 3;
            } else if (constraints.maxWidth > 700) {
              crossAxisCount = 2;
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.3,
              ),
              itemCount: projects.length,
              itemBuilder: (final context, final index) {
                return SearchTarget(
                      id: 'proj-$index',
                      child: ProjectCard(project: projects[index]),
                    )
                    .animate()
                    .fadeIn(delay: (index * 100).ms)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      curve: Curves.easeOut,
                    );
              },
            );
          },
        ),
      ],
    );
  }
}
