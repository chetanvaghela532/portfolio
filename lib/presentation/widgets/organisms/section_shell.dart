import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_surfaces.dart';
import '../atoms/tag_badge.dart';

class SectionShell extends StatelessWidget {
  const SectionShell({
    required this.eyebrow,
    required this.title,
    required this.child,
    super.key,
  });

  final String eyebrow;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: panelDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TagBadge(label: eyebrow, color: const Color(0xFF38BDF8)),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.sora(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.18,
            ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}
