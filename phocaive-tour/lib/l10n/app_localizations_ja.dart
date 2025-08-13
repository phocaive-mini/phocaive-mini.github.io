// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'フォカイブ ツアー';

  @override
  String get mapMenu => '地図';

  @override
  String get koreaMenu => '韓国';

  @override
  String get usaMenu => 'アメリカ';

  @override
  String get globalMenu => 'グローバル';

  @override
  String get moreMenu => 'その他';

  @override
  String get aboutApp => 'アプリについて';

  @override
  String get aboutDescription =>
      'フォカイブ ツアーは、BTSが訪れた場所をアーカイブし、ファンが世界中のBTS関連の場所を探索できる包括的なガイドを提供するアプリです。';

  @override
  String get loading => '読み込み中...';
}
