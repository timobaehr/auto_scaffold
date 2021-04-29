import 'dart:ui' as ui;

// null_aware_operator is required for Flutter web!
// ignore: invalid_null_aware_operator
String locale = ui.window.locale?.languageCode ?? 'en';

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