import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({required this.onBackToTop, super.key});

  final VoidCallback onBackToTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Container(height: 1, color: Colors.white.withValues(alpha: 0.08)),
          const SizedBox(height: 18),
          Text(
            '© ${DateTime.now().year} Chetan Vaghela',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
          ),
          const SizedBox(height: 8),
          TextButton(onPressed: onBackToTop, child: const Text('Back to top')),
        ],
      ),
    );
  }
}
