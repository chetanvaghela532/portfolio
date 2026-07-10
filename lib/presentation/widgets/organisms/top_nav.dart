import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../l10n/app_strings.dart';
import '../atoms/outline_button.dart';

class TopNav extends StatelessWidget {
  const TopNav({
    required this.onTapAbout,
    required this.onTapExperience,
    required this.onTapProjects,
    required this.onTapContact,
    required this.onOpenResume,
    super.key,
  });

  final VoidCallback onTapAbout;
  final VoidCallback onTapExperience;
  final VoidCallback onTapProjects;
  final VoidCallback onTapContact;
  final VoidCallback onOpenResume;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 900;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 28,
          vertical: 12,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 14 : 18,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xCC0A1528),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x80000000),
                    blurRadius: 30,
                    offset: Offset(0, 14),
                  ),
                ],
              ),
              child: isMobile
                  ? Row(
                      children: [
                        const Expanded(child: _BrandLockup()),
                        OutlineButtonWidget(
                          label: AppStrings.resume,
                          onTap: onOpenResume,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const _BrandLockup(),
                        const Spacer(),
                        Wrap(
                          spacing: 10,
                          children: [
                            _NavLink(
                              label: AppStrings.about,
                              onTap: onTapAbout,
                            ),
                            _NavLink(
                              label: AppStrings.experience,
                              onTap: onTapExperience,
                            ),
                            _NavLink(
                              label: AppStrings.projects,
                              onTap: onTapProjects,
                            ),
                            _NavLink(
                              label: AppStrings.contact,
                              onTap: onTapContact,
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        OutlineButtonWidget(
                          label: AppStrings.resume,
                          onTap: onOpenResume,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandLockup extends StatelessWidget {
  const _BrandLockup();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
              colors: [Color(0xFF63E6BE), Color(0xFF38BDF8)],
            ),
          ),
          child: Center(
            child: Text(
              'CV',
              style: GoogleFonts.sora(
                color: const Color(0xFF07111F),
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.brandName,
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              AppStrings.brandRole,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
