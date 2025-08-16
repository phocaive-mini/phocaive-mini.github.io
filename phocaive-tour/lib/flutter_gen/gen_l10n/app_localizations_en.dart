// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Phocaive Tour';

  @override
  String get tourGuideSubtitle => 'BTS Tour Guide';

  @override
  String get mapMenu => 'Map';

  @override
  String get koreaMenu => 'Korea';

  @override
  String get usaMenu => 'USA';

  @override
  String get globalMenu => 'Global';

  @override
  String get moreMenu => 'More';

  @override
  String get aboutApp => 'About App';

  @override
  String get aboutDescription =>
      'Phocaive Tour is an app that archives places visited by BTS, providing a comprehensive guide for fans to explore BTS-related locations around the world.';

  @override
  String get loading => 'Loading...';

  @override
  String get supportPhocaive => 'Support Phocaive🎉';

  @override
  String get webDebugMode => 'Web Debug Mode';

  @override
  String get webNotSupported => 'Not supported on web.';

  @override
  String get mobileAppContent => 'Actual web content loads in the mobile app.';

  @override
  String storeOpenError(String storeName) {
    return 'Unable to open $storeName.';
  }

  @override
  String get openInGoogleMaps => 'View in Google Maps';

  @override
  String get mapLinkCopied => 'Google Maps link copied to clipboard';

  @override
  String get viewLink => 'View Link';

  @override
  String get checkBtsPlaces => 'Check out BTS-related places';

  @override
  String get specialServiceForArmy => 'Special Service for ARMY';

  @override
  String get phocaiveDescription1 =>
      '\'Phocaive Tour\' is a service for \'ARMY\' that guides you to special places around the world visited by BTS members with maps.';

  @override
  String get phocaiveDescription2 =>
      'Travel following the footsteps of the members and discover the precious memories and stories they left behind.';

  @override
  String get phocaiveDescription3 =>
      'Start your special journey with Phocaive Tour right now to trace the footsteps of BTS members 💜';

  @override
  String get tipRequest => 'Tip Request';

  @override
  String get tipRequestMessage =>
      'If you have any BTS tour information that we haven\'t covered,\nplease feel free to share it with us 🙏';

  @override
  String get phocaiveAppIntro => 'Phocaive App Introduction';

  @override
  String get phocaiveServiceNote =>
      '\'Phocaive Tour\' is a service provided by \'Phocaive\'.';

  @override
  String get phocaiveMainAppNote =>
      '\'Phocaive\' is a photocard archiving & exchange service for BTS ARMY. Please search for \'Phocaive\' on the Play Store or App Store.';

  @override
  String get features => 'Features:';

  @override
  String get koreaGuide => 'Korea Guide';

  @override
  String get usaGuide => 'USA Guide';

  @override
  String get globalGuide => 'Global Guide';

  @override
  String get multiLanguageSupport => 'Multi-language Support';

  @override
  String get version => 'Version 1.0.0';

  @override
  String get downloadOnTheAppStore => 'Download on the';

  @override
  String get appStore => 'App Store';

  @override
  String get getItOn => 'GET IT ON';

  @override
  String get googlePlay => 'Google Play';

  @override
  String get testAdLoading => 'TEST AD LOADING...';

  @override
  String get adLoading => 'AD LOADING...';
}
