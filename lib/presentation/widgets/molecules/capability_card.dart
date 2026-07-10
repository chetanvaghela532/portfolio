import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_surfaces.dart';
import '../../../data/models/capability.dart';

class CapabilityCard extends StatelessWidget {
  const CapabilityCard({required this.item, super.key});

  final Capability item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: softDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, color: const Color(0xFF63E6BE), size: 28),
          const SizedBox(height: 16),
          Text(
            item.title,
            style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            item.description,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.78),
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
