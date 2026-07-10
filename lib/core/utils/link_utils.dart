import 'package:flutter/foundation.dart';

import 'package:meu_curriculo_flutter/core/utils/app_utils.dart';

class LinkUtils {
  static Future<void> openExternal(String rawUrl) async {
    await AppUtils.launchURL(rawUrl);
  }

  static Future<void> openResume() async {
    final url = kIsWeb
        ? 'assets/documents/resume.pdf'
        : 'file://${Uri.encodeFull('assets/documents/resume.pdf')}';
    await AppUtils.launchURL(url);
  }
}
