import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:localized_string/localized_string.dart';
import 'package:surf_cinema/generated/intl/messages_all.dart';

class AppStrings {
  static Future<AppStrings> load(Locale locale) {
    final name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    debugPrint('local: $locale');

    return initializeMessages(localeName).then((_) => AppStrings());
  }

  String get title => Intl.message(
        'Surf cinema',
        name: 'title',
        desc: 'The application title',
      );

  static AppStrings of(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings);
  }

  static LocalizedString string(String Function(AppStrings s) factory) =>
      LocalizedString.fromFactory((context) => factory(AppStrings.of(context)));

  String get connectionError => Intl.message(
        'Ошибка подключения',
        name: 'connectionError',
      );

  String get noInternetError => Intl.message(
        'Интернет соединение отсутствует',
        name: 'noInternetError',
      );

  String get cancelled => Intl.message('Cancelled', name: 'cancelled');
}
