import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_surfaces.dart';
import '../../../data/models/portfolio_stat.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({required this.stat, super.key});

  final PortfolioStat stat;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: softDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stat.value,
            style: GoogleFonts.sora(fontSize: 26, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            stat.label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.68),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
