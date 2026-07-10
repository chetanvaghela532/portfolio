// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final List<String> texts;
  final TextStyle? style;
  final Duration typingSpeed;
  final Duration deletingSpeed;
  final Duration holdDelay;
  final TextAlign textAlign;

  const TypewriterText({
    required this.texts,
    super.key,
    this.style,
    this.typingSpeed = const Duration(milliseconds: 100),
    this.deletingSpeed = const Duration(milliseconds: 50),
    this.holdDelay = const Duration(seconds: 2),
    this.textAlign = TextAlign.center,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayedText = '';
  int _currentIndex = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  Timer? _timer;
  Timer? _holdTimer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _holdTimer?.cancel();
    super.dispose();
  }

  void _startTyping() {
    if (!mounted || widget.texts.isEmpty) {
      return;
    }

    _timer?.cancel();
    _timer = Timer.periodic(
      _isDeleting ? widget.deletingSpeed : widget.typingSpeed,
      (final timer) {
        if (!mounted) return;

        final currentFullText = widget.texts[_currentIndex];

        if (_isDeleting) {
          if (_charIndex > 0) {
            _charIndex--;
            setState(() {
              _displayedText = currentFullText.substring(0, _charIndex);
            });
          } else {
            _isDeleting = false;
            _currentIndex = (_currentIndex + 1) % widget.texts.length;
            _timer?.cancel();
            _startTyping();
          }
        } else {
          if (_charIndex < currentFullText.length) {
            _charIndex++;
            setState(() {
              _displayedText = currentFullText.substring(0, _charIndex);
            });
          } else {
            _isDeleting = true;
            _timer?.cancel();
            _holdTimer?.cancel();
            _holdTimer = Timer(widget.holdDelay, () {
              if (mounted) {
                _startTyping();
              }
            });
          }
        }
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Text(
      '$_displayedText|',
      style: widget.style,
      textAlign: widget.textAlign,
    );
  }
}
