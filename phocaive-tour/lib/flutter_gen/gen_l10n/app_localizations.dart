import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('ko'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Phocaive Tour'**
  String get appTitle;

  /// Map menu item
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get mapMenu;

  /// Korea menu item
  ///
  /// In en, this message translates to:
  /// **'Korea'**
  String get koreaMenu;

  /// USA menu item
  ///
  /// In en, this message translates to:
  /// **'USA'**
  String get usaMenu;

  /// Global menu item
  ///
  /// In en, this message translates to:
  /// **'Global'**
  String get globalMenu;

  /// More menu item
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get moreMenu;

  /// About app page title
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutApp;

  /// App description
  ///
  /// In en, this message translates to:
  /// **'Phocaive Tour is an app that archives places visited by BTS, providing a comprehensive guide for fans to explore BTS-related locations around the world.'**
  String get aboutDescription;

  /// Loading text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Support button text
  ///
  /// In en, this message translates to:
  /// **'Support Phocaive'**
  String get supportPhocaive;

  /// Web debug mode title
  ///
  /// In en, this message translates to:
  /// **'Web Debug Mode'**
  String get webDebugMode;

  /// Web not supported message
  ///
  /// In en, this message translates to:
  /// **'Not supported on web.'**
  String get webNotSupported;

  /// Mobile app content message
  ///
  /// In en, this message translates to:
  /// **'Actual web content loads in the mobile app.'**
  String get mobileAppContent;

  /// Error message for opening app store
  ///
  /// In en, this message translates to:
  /// **'Unable to open {storeName}.'**
  String storeOpenError(String storeName);

  /// Button to open Google Maps
  ///
  /// In en, this message translates to:
  /// **'View in Google Maps'**
  String get openInGoogleMaps;

  /// Message when map link is copied
  ///
  /// In en, this message translates to:
  /// **'Google Maps link copied to clipboard'**
  String get mapLinkCopied;

  /// Link view button
  ///
  /// In en, this message translates to:
  /// **'View Link'**
  String get viewLink;

  /// Map description text
  ///
  /// In en, this message translates to:
  /// **'Check out BTS-related places'**
  String get checkBtsPlaces;

  /// Special service section title
  ///
  /// In en, this message translates to:
  /// **'Special Service for ARMY'**
  String get specialServiceForArmy;

  /// App description paragraph 1
  ///
  /// In en, this message translates to:
  /// **'Phocaive Tour is a service for \'ARMY\' that guides you to special places around the world visited by BTS members with maps.'**
  String get phocaiveDescription1;

  /// App description paragraph 2
  ///
  /// In en, this message translates to:
  /// **'Travel following the footsteps of the members and discover the precious memories and stories they left behind.'**
  String get phocaiveDescription2;

  /// App description paragraph 3
  ///
  /// In en, this message translates to:
  /// **'Start your special journey with Phocaive Tour right now to trace the footsteps of BTS members💜'**
  String get phocaiveDescription3;

  /// Tip request section title
  ///
  /// In en, this message translates to:
  /// **'Tip Request'**
  String get tipRequest;

  /// Tip request message
  ///
  /// In en, this message translates to:
  /// **'If you have any BTS tour information that we haven\'t covered, please feel free to share it with us🙏'**
  String get tipRequestMessage;

  /// App introduction section title
  ///
  /// In en, this message translates to:
  /// **'Phocaive App Introduction'**
  String get phocaiveAppIntro;

  /// Service note text
  ///
  /// In en, this message translates to:
  /// **'※ Phocaive Tour is a service provided by \'Phocaive\'.'**
  String get phocaiveServiceNote;

  /// Main app note text
  ///
  /// In en, this message translates to:
  /// **'※ Phocaive is a photocard archiving & exchange service for BTS ARMY. Please search for \'Phocaive\' on the Play Store or App Store.'**
  String get phocaiveMainAppNote;

  /// Features section title
  ///
  /// In en, this message translates to:
  /// **'Features:'**
  String get features;

  /// Korea guide feature
  ///
  /// In en, this message translates to:
  /// **'Korea Guide'**
  String get koreaGuide;

  /// USA guide feature
  ///
  /// In en, this message translates to:
  /// **'USA Guide'**
  String get usaGuide;

  /// Global guide feature
  ///
  /// In en, this message translates to:
  /// **'Global Guide'**
  String get globalGuide;

  /// Multi-language support feature
  ///
  /// In en, this message translates to:
  /// **'Multi-language Support'**
  String get multiLanguageSupport;

  /// App version
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get version;

  /// App Store download text
  ///
  /// In en, this message translates to:
  /// **'Download on the'**
  String get downloadOnTheAppStore;

  /// App Store text
  ///
  /// In en, this message translates to:
  /// **'App Store'**
  String get appStore;

  /// Google Play get it on text
  ///
  /// In en, this message translates to:
  /// **'GET IT ON'**
  String get getItOn;

  /// Google Play text
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get googlePlay;

  /// Test ad loading message
  ///
  /// In en, this message translates to:
  /// **'TEST AD LOADING...'**
  String get testAdLoading;

  /// Ad loading message
  ///
  /// In en, this message translates to:
  /// **'AD LOADING...'**
  String get adLoading;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
