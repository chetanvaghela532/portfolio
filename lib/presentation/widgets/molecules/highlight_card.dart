import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_surfaces.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({required this.value, required this.label, super.key});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(22),
      decoration: softDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: GoogleFonts.sora(fontSize: 34, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.76)),
          ),
        ],
      ),
    );
  }
}
