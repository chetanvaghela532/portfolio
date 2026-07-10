import 'package:flutter/material.dart';

class SkillPill extends StatelessWidget {
  const SkillPill(this.label, {this.compact = false, super.key});

  final String label;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 10 : 12,
        vertical: compact ? 8 : 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF10233F),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: compact ? 12 : 13,
          color: Colors.white.withValues(alpha: 0.82),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
