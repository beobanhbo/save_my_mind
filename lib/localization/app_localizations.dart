import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  static const supportedLocale = [Locale('vi'), Locale('en')];
  final Locale locale;
  Map<String, String> _localizationString;

  AppLocalization(this.locale);

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  //Load language json file
  Future<bool> load() async {
    final jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> json = jsonDecode(jsonString);
    _localizationString =
        json.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String localized(String key) {
    return _localizationString[key] ?? key;
  }

  String home() => localized('home');
  String settings() => localized('settings');
  String searchItem() => localized('searchItem');
  String note() => localized('note');
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalization.supportedLocale.contains(locale);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    final localizations = AppLocalization(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}
