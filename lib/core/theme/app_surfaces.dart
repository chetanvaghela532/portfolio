import 'package:flutter/material.dart';

BoxDecoration panelDecoration({Color background = const Color(0xCC0A1528)}) {
  return BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(30),
    border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
    boxShadow: const [
      BoxShadow(
        color: Color(0x73000000),
        blurRadius: 28,
        offset: Offset(0, 18),
      ),
    ],
  );
}

BoxDecoration softDecoration({Color background = const Color(0xFF0E1B31)}) {
  return BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
  );
}
