import 'package:flutter/material.dart';

import '../../../core/utils/link_utils.dart';
import '../../../data/models/contact_item.dart';
import '../atoms/outline_button.dart';
import '../atoms/primary_button.dart';
import '../molecules/contact_card.dart';
import 'section_shell.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    required this.items,
    required this.availabilityItems,
    required this.onOpenResume,
    super.key,
  });

  final List<ContactItem> items;
  final List<String> availabilityItems;
  final Future<void> Function() onOpenResume;

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      eyebrow: 'Contact',
      title:
          'Available for senior Flutter roles, product-focused contracts, and remote startup teams.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 900;
          return isMobile
              ? Column(
                  children: [
                    _ContactIntro(
                      availabilityItems: availabilityItems,
                      onOpenResume: onOpenResume,
                    ),
                    const SizedBox(height: 16),
                    _ContactGrid(items: items),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ContactIntro(
                        availabilityItems: availabilityItems,
                        onOpenResume: onOpenResume,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: _ContactGrid(items: items)),
                  ],
                );
        },
      ),
    );
  }
}

class _ContactIntro extends StatelessWidget {
  const _ContactIntro({
    required this.availabilityItems,
    required this.onOpenResume,
  });

  final List<String> availabilityItems;
  final Future<void> Function() onOpenResume;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1B31),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'If you need someone who can think through architecture, ship fast, and still care about product polish, I would be happy to talk.',
            style: TextStyle(
              fontSize: 16,
              height: 1.7,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              PrimaryButton(
                label: 'Email Me',
                onTap: () async {
                  await LinkUtils.openExternal(
                    'mailto:chetanvaghela457@gmail.com',
                  );
                },
              ),
              OutlineButtonWidget(
                label: 'Resume',
                onTap: () {
                  onOpenResume();
                },
              ),
            ],
          ),
          const SizedBox(height: 18),
          ...availabilityItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    size: 18,
                    color: Color(0xFF63E6BE),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(item)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactGrid extends StatelessWidget {
  const _ContactGrid({required this.items});

  final List<ContactItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ContactCard(item: item),
            ),
          )
          .toList(growable: false),
    );
  }
}
