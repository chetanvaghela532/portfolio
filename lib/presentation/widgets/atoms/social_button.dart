// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:meu_curriculo_flutter/core/theme/app_tokens.dart';
import 'package:meu_curriculo_flutter/core/utils/app_utils.dart';

/// Social/contact icon button with a neon hover glow, pointer cursor and an
/// accessible tooltip/semantic label.
class SocialButton extends StatefulWidget {
  final FaIconData icon;
  final String url;
  final Color? color;

  /// Accessible label. Falls back to the URL host when not provided.
  final String? tooltip;

  const SocialButton({
    required this.icon,
    required this.url,
    super.key,
    this.color,
    this.tooltip,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _hovered = false;

  @override
  Widget build(final BuildContext context) {
    final tokens = AppColorTokens.of(context);
    final accent = widget.color ?? tokens.primary;
    final label = widget.tooltip ?? Uri.tryParse(widget.url)?.host ?? 'Link';

    return Tooltip(
      message: label,
      child: Semantics(
        button: true,
        label: label,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: GestureDetector(
            onTap: () => AppUtils.launchURL(widget.url, context: context),
            child: AnimatedContainer(
              duration: AppTokens.motionFast,
              curve: AppTokens.motionCurve,
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _hovered
                    ? accent.withValues(alpha: 0.15)
                    : tokens.surfaceElevated,
                borderRadius: BorderRadius.circular(AppTokens.radiusMd),
                border: Border.all(
                  color: _hovered
                      ? accent.withValues(alpha: 0.8)
                      : tokens.border,
                ),
                boxShadow: _hovered
                    ? tokens.glow(accent, intensity: 0.35, blur: 16)
                    : null,
              ),
              child: Center(
                child: FaIcon(
                  widget.icon,
                  size: 22,
                  color: _hovered ? accent : tokens.muted,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
