import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_surfaces.dart';
import '../../../data/models/skill_group.dart';
import '../atoms/skill_pill.dart';

class SkillGroupCard extends StatelessWidget {
  const SkillGroupCard({required this.group, super.key});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: softDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.title,
            style: GoogleFonts.sora(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: group.items
                .map((item) => SkillPill(item))
                .toList(growable: false),
          ),
        ],
      ),
    );
  }
}
