import 'package:flutter/material.dart';

import '../../../core/theme/app_surfaces.dart';
import '../../../core/utils/link_utils.dart';
import '../../../data/models/contact_item.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({required this.item, super.key});

  final ContactItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => LinkUtils.openExternal(item.url),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: softDecoration(),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xFF10233F),
              ),
              child: Icon(item.icon, color: const Color(0xFF63E6BE)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.value,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_outward_rounded, color: Color(0xFF38BDF8)),
          ],
        ),
      ),
    );
  }
}
