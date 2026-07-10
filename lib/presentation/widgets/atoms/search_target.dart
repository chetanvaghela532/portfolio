// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/presentation/controllers/search_controller.dart';

/// Wraps a searchable block: registers [id] with the search controller (so it
/// can be scrolled into view) and draws a yellow ring around it while it is the
/// active search result. Uses `foregroundDecoration` so the ring never shifts
/// the child's layout.
class SearchTarget extends StatelessWidget {
  const SearchTarget({
    required this.id,
    required this.child,
    this.ring = true,
    this.radius = AppTokens.radiusXl,
    super.key,
  });

  final String id;
  final Widget child;

  /// Whether to draw the ring when active. Skills pass `false` (the chips carry
  /// their own highlight), keeping only the scroll target.
  final bool ring;
  final double radius;

  static const Color _ringColor = Color(0xFFFDE047);

  @override
  Widget build(final BuildContext context) {
    // Optional dependency: without a search controller (isolated tests) this is
    // a transparent pass-through wrapper.
    PortfolioSearchController? search;
    try {
      search = context.watch<PortfolioSearchController>();
    } on ProviderNotFoundException {
      search = null;
    }
    if (search == null) return child;

    final active = ring && search.isCurrent(id);

    return Container(
      key: search.keyFor(id),
      foregroundDecoration: active
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: _ringColor, width: 2),
            )
          : null,
      child: child,
    );
  }
}
