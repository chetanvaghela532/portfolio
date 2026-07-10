import 'package:flutter/material.dart';

import '../../../data/models/capability.dart';
import '../molecules/capability_card.dart';
import 'section_shell.dart';

class CapabilitySection extends StatelessWidget {
  const CapabilitySection({required this.items, super.key});

  final List<Capability> items;

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      eyebrow: 'What I bring',
      title:
          'The work is broader than app screens. It includes platform depth, architecture, monetization, and delivery quality.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 900;
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: items
                .map(
                  (item) => SizedBox(
                    width: isMobile
                        ? constraints.maxWidth
                        : (constraints.maxWidth - 16) / 2,
                    child: CapabilityCard(item: item),
                  ),
                )
                .toList(growable: false),
          );
        },
      ),
    );
  }
}
