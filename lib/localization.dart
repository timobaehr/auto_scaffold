import 'dart:ui' as ui;

String locale = ui.window.locale.languageCode;

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

  static String save() {
    switch (locale) {
      case 'de':
        return 'Speichern';
      case 'fr':
        return 'Save';
      case 'it':
        return 'Salva';
      case 'sp':
        return 'Guardar';
      case 'pt':
        return 'Guardar';
      case 'ru':
        return 'Сохранить';
      default:
        return 'Save';
    }
  }

  static String continuer() {
    switch (locale) {
      case 'de':
        return 'Weiter';
      case 'fr':
        return 'Continuer';
      case 'it':
        return 'Vai a';
      case 'sp':
        return 'Ir a';
      case 'pt':
        return 'Ir para';
      case 'ru':
        return 'Перейти к';
      default:
        return 'Continue';
    }
  }

  static String back() {
    switch (locale) {
      case 'de':
        return 'Zurück';
      case 'fr':
        return 'Retour';
      case 'it':
        return 'Indietro';
      case 'sp':
        return 'Volver';
      case 'pt':
        return 'Voltar';
      case 'ru':
        return 'Назад';
      default:
        return 'Back';
    }
  }

  static String okay() {
    switch (locale) {
      default:
        return 'OK';
    }
  }

  static String cancel() {
    switch (locale) {
      case 'de':
        return 'Abbrechen';
      case 'fr':
        return 'Annuler';
      case 'it':
        return 'Cancella';
      case 'sp':
        return 'Cancelar';
      case 'pt':
        return 'Cancelar';
      case 'ru':
        return 'Отменить';
      default:
        return 'Cancel';
    }
  }

  static String close() {
    switch (locale) {
      case 'de':
        return 'Schließen';
      case 'fr':
        return 'Fermer';
      case 'it':
        return 'Chiudere';
      case 'sp':
        return 'Cerrar';
      case 'pt':
        return 'Fechar';
      case 'ru':
        return 'Закрыть';
      default:
        return 'Close';
    }
  }

  static String open() {
    switch (locale) {
      case 'de':
        return 'Öffnen';
      case 'fr':
        return 'Ouvrez';
      case 'it':
        return 'Aprire';
      case 'sp':
        return 'Abrir';
      case 'pt':
        return 'Aberto';
      case 'ru':
        return 'Открыть';
      default:
        return 'Open';
    }
  }

  static String delete() {
    switch (locale) {
      case 'de':
        return 'Löschen';
      case 'fr':
        return 'Effacer';
      case 'it':
        return 'Cancellare';
      case 'sp':
        return 'Borrar';
      case 'pt':
        return 'Eliminar';
      case 'ru':
        return 'Удалить';
      default:
        return 'Delete';
    }
  }

  static String yes() {
    switch (locale) {
      case 'de':
        return 'ja';
      case 'fr':
        return 'oui';
      case 'it':
        return 'sì';
      case 'sp':
        return 'sí';
      case 'pt':
        return 'sim';
      case 'ru':
        return 'да';
      default:
        return 'yes';
    }
  }

  static String no() {
    switch (locale) {
      case 'de':
        return 'nein';
      case 'fr':
        return 'non';
      case 'it':
        return 'no';
      case 'sp':
        return 'no';
      case 'pt':
        return 'não';
      case 'ru':
        return 'нет';
      default:
        return 'no';
    }
  }

  static String loading() {
    switch (locale) {
      case 'de':
        return 'Lade Daten';
      case 'it':
        return 'Caricamento dei dati';
      case 'fr':
        return 'Charger les données';
      case 'sp':
        return 'Carga de datos';
      case 'pt':
        return 'Carregamento de dados';
      case 'ru':
        return 'Данные по загрузке';
      default:
        return 'Loading data';
    }
  }

  static String day() {
    switch (locale) {
      case 'de':
        return 'Tag';
      case 'fr':
        return 'jour';
      case 'it':
        return 'Giorno';
      case 'sp':
        return 'Día';
      case 'pt':
        return 'Dia';
      case 'ru':
        return 'День';
      default:
        return 'day';
    }
  }

  static String share() {
    switch (locale) {
      case 'de':
        return 'Teilen';
      case 'fr':
        return 'Partager';
      case 'it':
        return 'Condividi';
      case 'sp':
        return 'Compartir';
      case 'pt':
        return 'Partilhar';
      case 'ru':
        return 'Поделиться';
      default:
        return 'Share';
    }
  }

  static String learnMore() {
    switch (locale) {
      case 'de':
        return 'Mehr erfahren';
      case 'fr':
        return "Plus d'infos";
      case 'it':
        return 'Scopri di più';
      case 'sp':
        return 'Más información';
      case 'pt':
        return 'Saiba mais';
      case 'ru':
        return 'Узнать больше';
      default:
        return 'Learn more';
    }
  }
}