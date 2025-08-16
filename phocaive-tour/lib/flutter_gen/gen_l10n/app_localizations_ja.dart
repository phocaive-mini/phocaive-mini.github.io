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
  String get tourGuideSubtitle => 'BTSツアーガイド';

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

  @override
  String get supportPhocaive => 'フォカイブを応援🎉';

  @override
  String get webDebugMode => 'ウェブデバッグモード';

  @override
  String get webNotSupported => 'ウェブではサポートされていません。';

  @override
  String get mobileAppContent => 'モバイルアプリでは実際のウェブコンテンツが読み込まれます。';

  @override
  String storeOpenError(String storeName) {
    return '$storeNameを開くことができません。';
  }

  @override
  String get openInGoogleMaps => 'Google Mapsで見る';

  @override
  String get mapLinkCopied => 'Google Mapsリンクがクリップボードにコピーされました';

  @override
  String get viewLink => 'リンクを見る';

  @override
  String get checkBtsPlaces => 'BTS関連の場所をチェック';

  @override
  String get specialServiceForArmy => 'ARMYのための特別サービス';

  @override
  String get phocaiveDescription1 =>
      '\'フォカイブ ツアー\'は、BTSメンバーが訪れた世界中の特別な場所を地図とともに案内する\'ARMY\'のためのサービスです。';

  @override
  String get phocaiveDescription2 =>
      'メンバーの足跡をたどって旅行し、彼らが残した大切な思い出と物語を発見してください。';

  @override
  String get phocaiveDescription3 =>
      '今すぐフォカイブツアーと一緒にBTSメンバーの足跡が残る特別な旅を始めましょう 💜';

  @override
  String get tipRequest => '情報提供のお願い';

  @override
  String get tipRequestMessage =>
      'まだ收集できていないBTSツアー情報がありましたら、\nいつでも情報提供をお願いいたします 🙏';

  @override
  String get phocaiveAppIntro => 'フォカイブアプリ紹介';

  @override
  String get phocaiveServiceNote => '\'フォカイブ ツアー\'は\'フォカイブ\'が提供するサービスです。';

  @override
  String get phocaiveMainAppNote =>
      '\'フォカイブ\'はBTS ARMYのためのフォトカードアーカイブ&交換サービスです。Play StoreまたはApp Storeで\'フォカイブ\'を検索してください。';

  @override
  String get features => '機能:';

  @override
  String get koreaGuide => '韓国ガイド';

  @override
  String get usaGuide => 'アメリカガイド';

  @override
  String get globalGuide => 'グローバルガイド';

  @override
  String get multiLanguageSupport => '多言語サポート';

  @override
  String get version => 'バージョン 1.0.0';

  @override
  String get downloadOnTheAppStore => 'ダウンロード';

  @override
  String get appStore => 'App Store';

  @override
  String get getItOn => 'ダウンロード';

  @override
  String get googlePlay => 'Google Play';

  @override
  String get testAdLoading => 'テスト広告読み込み中...';

  @override
  String get adLoading => '広告読み込み中...';
}
