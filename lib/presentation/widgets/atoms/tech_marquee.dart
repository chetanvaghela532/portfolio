import 'package:flutter/material.dart';

import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';

class TechMarquee extends StatefulWidget {
  const TechMarquee({super.key});

  static const List<_TechItem> _items = [
    _TechItem('Flutter', Color(0xFF47C5FB)),
    _TechItem('Dart', Color(0xFF0175C2)),
    _TechItem('React', Color(0xFF61DAFB)),
    _TechItem('Android', Color(0xFF3DDC84)),
    _TechItem('Swift', Color(0xFFF05138)),
    _TechItem('iOS', Color(0xFFA2AAAD)),
    _TechItem('Node', Color(0xFF8CC84B)),
    _TechItem('JS', Color(0xFFF7DF1E)),
    _TechItem('Java', Color(0xFFF89820)),
    _TechItem('Docker', Color(0xFF2496ED)),
    _TechItem('SQL', Color(0xFF3ECF8E)),
    _TechItem('Git', Color(0xFFF05032)),
    _TechItem('Python', Color(0xFF4B8BBE)),
    _TechItem('HTML', Color(0xFFE34F26)),
    _TechItem('CSS', Color(0xFF1572B6)),
    _TechItem('Linux', Color(0xFFFCC624)),
  ];

  static const double _itemWidth = 92;
  static const double _height = 40;

  @override
  State<TechMarquee> createState() => _TechMarqueeState();
}

class _TechMarqueeState extends State<TechMarquee>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final tokens = AppColorTokens.of(context);
    final rowWidth = TechMarquee._items.length * TechMarquee._itemWidth;

    return ExcludeSemantics(
      child: SizedBox(
        height: TechMarquee._height,
        child: ShaderMask(
          shaderCallback: (final rect) => const LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
            stops: [0.0, 0.08, 0.92, 1.0],
          ).createShader(rect),
          blendMode: BlendMode.dstIn,
          child: ClipRect(
            child: OverflowBox(
              alignment: Alignment.centerLeft,
              maxWidth: double.infinity,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (final context, final child) {
                  return Transform.translate(
                    offset: Offset(-_controller.value * rowWidth, 0),
                    child: child,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [_buildRow(tokens), _buildRow(tokens)],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(final AppColorTokens tokens) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: TechMarquee._items
          .map(
            (final item) => SizedBox(
              width: TechMarquee._itemWidth,
              child: Center(
                child: _HoverChip(item: item, tokens: tokens),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _TechItem {
  const _TechItem(this.label, this.brand);

  final String label;
  final Color brand;
}

class _HoverChip extends StatefulWidget {
  const _HoverChip({required this.item, required this.tokens});

  final _TechItem item;
  final AppColorTokens tokens;

  @override
  State<_HoverChip> createState() => _HoverChipState();
}

class _HoverChipState extends State<_HoverChip> {
  bool _hovered = false;

  @override
  Widget build(final BuildContext context) {
    final color = _hovered ? widget.item.brand : widget.tokens.muted;

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (final _) => setState(() => _hovered = true),
      onExit: (final _) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.06 : 1,
        duration: AppTokens.motionFast,
        curve: AppTokens.motionCurve,
        child: AnimatedContainer(
          duration: AppTokens.motionFast,
          curve: AppTokens.motionCurve,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.item.brand.withValues(alpha: 0.14)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppTokens.radiusPill),
            border: Border.all(
              color: _hovered
                  ? widget.item.brand.withValues(alpha: 0.55)
                  : widget.tokens.border.withValues(alpha: 0.55),
            ),
          ),
          child: Text(
            widget.item.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
