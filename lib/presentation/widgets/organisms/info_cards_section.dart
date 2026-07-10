import 'package:flutter/material.dart';

import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/data/models/certificate_model.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/search_target.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/section_header.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/molecules/certificate_card.dart';

class InfoCardsSection extends StatelessWidget {
  const InfoCardsSection({
    required this.title,
    required this.marker,
    required this.targetPrefix,
    required this.items,
    super.key,
  });

  final String title;
  final String marker;
  final String targetPrefix;
  final List<CertificateModel> items;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(marker: marker, title: title),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (final context, final constraints) {
            final cardWidth = constraints.maxWidth > 1100
                ? (constraints.maxWidth - 48) / 3
                : constraints.maxWidth > 700
                ? (constraints.maxWidth - 24) / 2
                : constraints.maxWidth;

            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: List.generate(items.length, (index) {
                return SizedBox(
                  width: cardWidth,
                  child: SearchTarget(
                    id: '$targetPrefix-$index',
                    radius: AppTokens.radiusLg,
                    child: CertificateCard(certificate: items[index]),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}
