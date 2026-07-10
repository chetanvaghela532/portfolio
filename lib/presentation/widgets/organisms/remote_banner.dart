import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_surfaces.dart';

class RemoteBanner extends StatelessWidget {
  const RemoteBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 900;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      decoration: panelDecoration(background: const Color(0xFF0D192E)),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Built for remote product teams that care about quality and speed',
                  style: GoogleFonts.sora(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Immediate joiner • EST/PST overlap available • Proven async collaboration and product ownership',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.78),
                    height: 1.6,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Text(
                    'Built for remote product teams that care about quality and speed',
                    style: GoogleFonts.sora(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Text(
                    'Immediate joiner • EST/PST overlap available • Proven async collaboration and product ownership',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.78),
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
