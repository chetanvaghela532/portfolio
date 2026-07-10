import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:meu_curriculo_flutter/core/constants/app_constants.dart';
import 'package:meu_curriculo_flutter/presentation/controllers/portfolio_controller.dart';

class GlassHeader extends StatelessWidget {
  const GlassHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    final controller = context.read<PortfolioController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child:
          Container(
            margin: const EdgeInsets.only(top: 20),
            constraints: const BoxConstraints(maxWidth: 1200),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: LayoutBuilder(
                  builder: (final context, final constraints) {
                    final headerWidth = constraints.maxWidth;
                    final useCompactMenu = headerWidth < 1080;
                    final horizontalPadding = headerWidth < 640 ? 18.0 : 30.0;
                    final logoFontSize = headerWidth < 420 ? 16.0 : 19.0;

                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.black.withValues(alpha: 0.6)
                            : Colors.white.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => controller.scrollToSection(
                                  controller.heroKey,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '<${AppStrings.portfolioTitle} />',
                                      maxLines: 1,
                                      style: GoogleFonts.jetBrainsMono(
                                        fontWeight: FontWeight.w800,
                                        fontSize: logoFontSize,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          if (useCompactMenu)
                            _CompactHeaderMenu(
                              controller: controller,
                              isDark: isDark,
                            )
                          else
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _HeaderItem(
                                  title: 'Skills',
                                  onTap: () => controller.scrollToSection(
                                    controller.skillsKey,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                _HeaderItem(
                                  title: 'Experience',
                                  onTap: () => controller.scrollToSection(
                                    controller.experienceKey,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                _HeaderItem(
                                  title: 'Projects',
                                  onTap: () => controller.scrollToSection(
                                    controller.projectsKey,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                _HeaderItem(
                                  title: 'Certificates',
                                  onTap: () => controller.scrollToSection(
                                    controller.certificatesKey,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                _HeaderItem(
                                  title: 'Highlights',
                                  onTap: () => controller.scrollToSection(
                                    controller.highlightsKey,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                _HeaderItem(
                                  title: 'Education',
                                  onTap: () => controller.scrollToSection(
                                    controller.educationKey,
                                  ),
                                ),
                                const SizedBox(width: 18),
                                IconButton(
                                  icon: Icon(
                                    isDark ? Icons.light_mode : Icons.dark_mode,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  onPressed: controller.toggleTheme,
                                  tooltip: 'Toggle theme',
                                ).animate().rotate(duration: 500.ms),
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ).animate().slideY(
            begin: -1,
            end: 0,
            duration: 800.ms,
            curve: Curves.easeOutBack,
          ),
    );
  }
}

class _CompactHeaderMenu extends StatelessWidget {
  const _CompactHeaderMenu({required this.controller, required this.isDark});

  final PortfolioController controller;
  final bool isDark;

  @override
  Widget build(final BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu, color: Theme.of(context).colorScheme.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onSelected: (final value) {
        if (value == 'theme') {
          controller.toggleTheme();
        } else if (value == 'skills') {
          controller.scrollToSection(controller.skillsKey);
        } else if (value == 'experience') {
          controller.scrollToSection(controller.experienceKey);
        } else if (value == 'projects') {
          controller.scrollToSection(controller.projectsKey);
        } else if (value == 'certificates') {
          controller.scrollToSection(controller.certificatesKey);
        } else if (value == 'highlights') {
          controller.scrollToSection(controller.highlightsKey);
        } else if (value == 'education') {
          controller.scrollToSection(controller.educationKey);
        }
      },
      itemBuilder: (final BuildContext context) => [
        const PopupMenuItem(value: 'skills', child: Text('Skills')),
        const PopupMenuItem(value: 'experience', child: Text('Experience')),
        const PopupMenuItem(value: 'projects', child: Text('Projects')),
        const PopupMenuItem(value: 'certificates', child: Text('Certificates')),
        const PopupMenuItem(value: 'highlights', child: Text('Highlights')),
        const PopupMenuItem(value: 'education', child: Text('Education')),
        PopupMenuItem(
          value: 'theme',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(isDark ? 'Light Mode' : 'Dark Mode'),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderItem extends StatefulWidget {
  const _HeaderItem({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  State<_HeaderItem> createState() => _HeaderItemState();
}

class _HeaderItemState extends State<_HeaderItem> {
  bool isHovered = false;

  @override
  Widget build(final BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isHovered
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: isHovered ? FontWeight.bold : FontWeight.w500,
              color: isHovered
                  ? Theme.of(context).colorScheme.primary
                  : (isDark ? Colors.white : Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
