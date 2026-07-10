import 'package:flutter/material.dart';

class PhoneFrame extends StatelessWidget {
  const PhoneFrame({required this.assetPath, this.width = 220, super.key});

  final String assetPath;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF091426),
        borderRadius: BorderRadius.circular(34),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 24,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: AspectRatio(
          aspectRatio: 0.52,
          child: Image.asset(assetPath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
