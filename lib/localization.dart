import 'dart:ui' as ui;

import 'dart:ui';

/*
 * Unfortunately for Flutter Web we have to cheat here a bit to get no warnings.
 * null-aware operation '!' has type 'bool' which excludes null flutter web ui.window.locale
 */
const bool _stupid = false;
final Locale? _tempLocale = _stupid ? null : ui.window.locale;
final String locale = _tempLocale?.languageCode ?? 'en';

// ignore: avoid_classes_with_only_static_members
class StringsCommon {
  static String collapse() {
    switch (locale) {
      case 'de':
        return 'Zusammenklappen';
      case 'fr':
        return 'Plier';
      case 'it':
        return 'Piegare';
      case 'sp':
        return 'Colapso';
      case 'pt':
        return 'Colapso';
      case 'ru':
        return 'Свернуть';
      default:
        return 'Collapse';
    }
  }
}
