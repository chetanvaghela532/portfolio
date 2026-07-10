import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_surfaces.dart';

class MiniFeatureCard extends StatelessWidget {
  const MiniFeatureCard({
    required this.label,
    required this.title,
    required this.description,
    super.key,
  });

  final String label;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: softDecoration(background: const Color(0xFF0C1930)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF63E6BE),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: GoogleFonts.sora(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.74),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
