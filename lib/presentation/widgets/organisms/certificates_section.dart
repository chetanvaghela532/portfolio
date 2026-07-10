// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/data/models/certificate_model.dart';
import 'package:meu_curriculo_flutter/l10n/arb/app_localizations.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/search_target.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/atoms/section_header.dart';
import 'package:meu_curriculo_flutter/presentation/widgets/molecules/certificate_card.dart';

class CertificatesSection extends StatelessWidget {
  final List<CertificateModel> certificates;

  const CertificatesSection({required this.certificates, super.key});

  @override
  Widget build(final BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(marker: '// 04', title: l.sectionCertificates),
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
              children: List.generate(certificates.length, (index) {
                return SizedBox(
                  width: cardWidth,
                  child: SearchTarget(
                    id: 'cert-$index',
                    radius: AppTokens.radiusLg,
                    child: CertificateCard(certificate: certificates[index]),
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
