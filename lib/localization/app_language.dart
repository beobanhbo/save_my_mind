import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:savemymind/config/app_constants.dart';

class AppLanguage {
  String currentLocale = 'vi';
  final _storage = const FlutterSecureStorage();
  Future<void> fetchLocale() async {
    final locale = await _storage.read(key: KeyStore.userLocale);
    if (locale == null) {
      currentLocale = 'en';
    } else {
      currentLocale = locale;
    }
  }

  void changeLocale(String locale) async {
    currentLocale = locale;
    await _storage.write(key: KeyStore.userLocale, value: locale);
  }
}
