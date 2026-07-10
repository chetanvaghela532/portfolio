import 'package:flutter/material.dart';

import '../molecules/highlight_card.dart';
import 'section_shell.dart';

class HighlightsSection extends StatelessWidget {
  const HighlightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionShell(
      eyebrow: 'Highlights',
      title:
          'The signal is consistent: reliable releases, measurable outcomes, and the ability to move from idea to shipped product quickly.',
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          HighlightCard(value: '40%', label: 'Recurring revenue uplift'),
          HighlightCard(value: '85%', label: 'Crash reduction'),
          HighlightCard(value: '10M+', label: 'Total downloads supported'),
          HighlightCard(value: '50+', label: 'Apps published'),
        ],
      ),
    );
  }
}
