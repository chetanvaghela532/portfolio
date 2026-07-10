import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static String assetUrl(final String assetPath) =>
      Uri.base.resolve(assetPath).toString();

  static String _errorMessage(final Object error) {
    final text = error.toString();
    return text.contains('LegacyJavaScriptObject')
        ? 'Browser blocked or rejected the requested link.'
        : text;
  }

  static Future<void> launchURL(
    final String url, {
    final BuildContext? context,
  }) async {
    final uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, webOnlyWindowName: '_blank')) {
        throw Exception('Could not launch $url');
      }
    } catch (error, stackTrace) {
      final message = _errorMessage(error);
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open link: $message')),
        );
      }
      debugPrint('Error opening URL: $message');
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}
