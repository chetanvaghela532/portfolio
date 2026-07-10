import 'package:flutter/material.dart';

class ContactItem {
  const ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
  });

  final IconData icon;
  final String label;
  final String value;
  final String url;
}
