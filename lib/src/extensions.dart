import 'dart:io';

import 'package:flutter/foundation.dart';

class Environment {
  /// Whether the environment is of type
  /// [WebBrowser](https://en.wikipedia.org/wiki/Web_browser).
  static const bool isWebBrowser = kIsWeb;

  /// Whether the environment is of type
  /// [iOS](https://en.wikipedia.org/wiki/IOS).
  static bool isIOS() => !isWebBrowser && Platform.isIOS;

  /// Whether the environment is of type
  /// [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29).
  static bool isAndroid() => !isWebBrowser && Platform.isAndroid;

  /// Whether the environment is of type
  /// [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29).
  static bool isSmartphoneApp() =>
      !isWebBrowser && (Platform.isAndroid || Platform.isIOS);
}
