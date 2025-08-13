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
}
