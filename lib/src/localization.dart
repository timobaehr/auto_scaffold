import 'dart:ui' as ui;

import 'dart:ui';

// ignore: deprecated_member_use
final Locale? _tempLocale = ui.window.locale;

final String locale = _tempLocale?.languageCode ?? 'en';

// ignore: avoid_classes_with_only_static_members
class StringsCommon {
  static String collapse() {
    switch (locale) {
      case 'da':
        return 'Luk';
      case 'de':
        return 'Zusammenklappen';
      case 'et':
        return 'Sulge';
      case 'el':
        return 'Κλείστε';
      case 'es':
        return 'Colapso';
      case 'fi':
        return 'Sulje';
      case 'fr':
        return 'Plier';
      case 'id':
        return 'Menciutkan';
      case 'it':
        return 'Chiudere';
      case 'lv':
        return 'Salocīt';
      case 'lt':
        return 'Sulenkite';
      case 'nl':
        return 'Inklappen';
      case 'pl':
        return 'Zwiń';
      case 'pt':
        return 'Colapso';
      case 'uk':
        return 'Згорнути';
      case 'ru':
        return 'Свернуть';
      default:
        return 'Collapse';
    }
  }
}
