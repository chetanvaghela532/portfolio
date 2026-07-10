// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';

/// Minimalist, auto-scrolling monochrome strip of tech logos.
///
/// Replaces the old scattered "magnetic" icons with a single tidy row that
/// loops seamlessly. Icons are muted and uniform; the edges fade out so the
/// strip reads as ambient texture rather than a busy focal point.
class TechMarquee extends StatefulWidget {
  const TechMarquee({super.key});

  // Cada ícone com a cor oficial da sua marca (usada no hover). Tons escolhidos
  // para permanecer legíveis sobre o fundo escuro (tema padrão). Apple é
  // monocromática, então usamos o cinza "silver" que aparece nos dois temas.
  static const List<_TechIcon> _icons = [
    _TechIcon(FontAwesomeIcons.flutter, Color(0xFF47C5FB)),
    _TechIcon(FontAwesomeIcons.dartLang, Color(0xFF0175C2)),
    _TechIcon(FontAwesomeIcons.react, Color(0xFF61DAFB)),
    _TechIcon(FontAwesomeIcons.android, Color(0xFF3DDC84)),
    _TechIcon(FontAwesomeIcons.swift, Color(0xFFF05138)),
    _TechIcon(FontAwesomeIcons.apple, Color(0xFFA2AAAD)),
    _TechIcon(FontAwesomeIcons.nodeJs, Color(0xFF8CC84B)),
    _TechIcon(FontAwesomeIcons.js, Color(0xFFF7DF1E)),
    _TechIcon(FontAwesomeIcons.java, Color(0xFFF89820)),
    _TechIcon(FontAwesomeIcons.docker, Color(0xFF2496ED)),
    _TechIcon(FontAwesomeIcons.database, Color(0xFF3ECF8E)),
    _TechIcon(FontAwesomeIcons.gitAlt, Color(0xFFF05032)),
    _TechIcon(FontAwesomeIcons.python, Color(0xFF4B8BBE)),
    _TechIcon(FontAwesomeIcons.html5, Color(0xFFE34F26)),
    _TechIcon(FontAwesomeIcons.css3, Color(0xFF1572B6)),
    _TechIcon(FontAwesomeIcons.linux, Color(0xFFFCC624)),
  ];

  static const double _itemWidth = 64;
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
    final rowWidth = TechMarquee._icons.length * TechMarquee._itemWidth;

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
      children: TechMarquee._icons
          .map(
            (final item) => SizedBox(
              width: TechMarquee._itemWidth,
              child: Center(
                child: _HoverIcon(item: item, tokens: tokens),
              ),
            ),
          )
          .toList(),
    );
  }
}

/// Pairs a tech logo with its official brand color.
class _TechIcon {
  const _TechIcon(this.icon, this.brand);

  final FaIconData icon;
  final Color brand;
}

/// A single marquee icon that lights up in its real brand color while hovered.
class _HoverIcon extends StatefulWidget {
  const _HoverIcon({required this.item, required this.tokens});

  final _TechIcon item;
  final AppColorTokens tokens;

  @override
  State<_HoverIcon> createState() => _HoverIconState();
}

class _HoverIconState extends State<_HoverIcon> {
  bool _hovered = false;

  @override
  Widget build(final BuildContext context) {
    // At rest the strip stays muted/monochrome; on hover the icon reveals its
    // official brand color (JS yellow, TS/Docker blue, Swift orange, …).
    final color = _hovered ? widget.item.brand : widget.tokens.muted;

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (final _) => setState(() => _hovered = true),
      onExit: (final _) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.25 : 1,
        duration: AppTokens.motionFast,
        curve: AppTokens.motionCurve,
        child: TweenAnimationBuilder<Color?>(
          duration: AppTokens.motionFast,
          curve: AppTokens.motionCurve,
          tween: ColorTween(end: color),
          builder: (final context, final animatedColor, final _) =>
              FaIcon(widget.item.icon, size: 24, color: animatedColor),
        ),
      ),
    );
  }
}
