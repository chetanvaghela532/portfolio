import 'package:flutter/material.dart';

import '../molecules/proof_card.dart';
import 'section_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionShell(
      eyebrow: 'About me',
      title:
          'Senior Flutter developer with strong product execution and production discipline.',
      child: _AboutContent(),
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;
        return isMobile
            ? const Column(
                children: [
                  _AboutNarrative(),
                  SizedBox(height: 16),
                  _AboutProofs(),
                ],
              )
            : const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 10, child: _AboutNarrative()),
                  SizedBox(width: 24),
                  Expanded(flex: 8, child: _AboutProofs()),
                ],
              );
      },
    );
  }
}

class _AboutNarrative extends StatelessWidget {
  const _AboutNarrative();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BodyBlock(
          text:
              'Senior Flutter Developer with 6+ years building scalable production apps across e-commerce, streaming, enterprise workflows, and AI. I specialize in Clean Architecture, BLoC/Riverpod state management, GraphQL, Firebase, subscriptions, and shipping reliable iOS + Android apps for global users.',
        ),
        const SizedBox(height: 16),
        _BodyBlock(
          text:
              'As a solo founder, I shipped two AI-powered Flutter apps from concept to launch in under 3 months. Across client and product work, I have improved recurring revenue by 40%, reduced crash rates by 85%, and supported products reaching 10M+ total downloads.',
        ),
      ],
    );
  }
}

class _BodyBlock extends StatelessWidget {
  const _BodyBlock({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        height: 1.8,
        color: Colors.white.withValues(alpha: 0.8),
      ),
    );
  }
}

class _AboutProofs extends StatelessWidget {
  const _AboutProofs();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProofCard(
          title: 'Remote-ready',
          body:
              'Immediate joiner, comfortable with EST/PST overlap, async-first communication, and ownership from architecture through store release.',
        ),
        SizedBox(height: 12),
        ProofCard(
          title: 'Technical edge',
          body:
              'Strong in state-management decisions, monetization flows, CI/CD, GraphQL backends, and production debugging with Crashlytics.',
        ),
        SizedBox(height: 12),
        ProofCard(
          title: 'Best fit',
          body:
              'Senior or lead Flutter roles where product thinking, execution speed, and clean architecture matter.',
        ),
      ],
    );
  }
}
