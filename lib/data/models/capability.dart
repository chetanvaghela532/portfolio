import 'package:flutter/material.dart';

class Capability {
  const Capability({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}
