import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:flutter/widgets.dart';


class ApplicationLocalizationDelegate
    extends LocalizationsDelegate<Translations> {
  const ApplicationLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => [
    Translations.kLanguageEnglish,
    Translations.kLanguageJapanese
  ].contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate old) => false;

  @override
  Future<Translations> load(Locale locale) async {
    var localizations = Translations.getInstance;
    localizations.setLocale(locale);
    await localizations.load();
    return localizations;
  }
}
