// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:meu_curriculo_flutter/presentation/controllers/search_controller.dart';

/// A drop-in [Text] replacement that paints a yellow highlight over every
/// occurrence of the active in-app search query. When there is no query (or no
/// match) it renders exactly like a plain [Text].
class HighlightText extends StatelessWidget {
  const HighlightText(
    this.data, {
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    super.key,
  });

  final String data;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  static const Color _highlightBg = Color(0xFFFDE047); // amber-300
  static const Color _highlightFg = Color(0xFF111111);

  @override
  Widget build(final BuildContext context) {
    // Optional dependency: outside the app (e.g. isolated widget tests) there is
    // no search controller, and this just behaves like a plain Text.
    PortfolioSearchController? search;
    try {
      search = context.watch<PortfolioSearchController>();
    } on ProviderNotFoundException {
      search = null;
    }
    final query = (search?.query ?? '').trim().toLowerCase();

    if (query.isEmpty || !data.toLowerCase().contains(query)) {
      return Text(
        data,
        style: style,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      );
    }

    final spans = <TextSpan>[];
    final lower = data.toLowerCase();
    var start = 0;
    while (true) {
      final index = lower.indexOf(query, start);
      if (index < 0) {
        spans.add(TextSpan(text: data.substring(start)));
        break;
      }
      if (index > start) {
        spans.add(TextSpan(text: data.substring(start, index)));
      }
      spans.add(
        TextSpan(
          text: data.substring(index, index + query.length),
          style: const TextStyle(
            backgroundColor: _highlightBg,
            color: _highlightFg,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
      start = index + query.length;
    }

    return Text.rich(
      TextSpan(style: style, children: spans),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
