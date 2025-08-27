// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '포카이브 투어';

  @override
  String get tourGuideSubtitle => '방탄소년단(BTS) 투어 가이드';

  @override
  String get mapMenu => '지도';

  @override
  String get koreaMenu => '한국';

  @override
  String get usaMenu => '미국';

  @override
  String get globalMenu => '글로벌';

  @override
  String get moreMenu => '더보기';

  @override
  String get aboutApp => '앱 소개';

  @override
  String get aboutDescription =>
      '포카이브 투어는 방탄소년단이 다녀간 장소들을 아카이빙하여, 팬들에게 전 세계 BTS 관련 장소들을 탐험할 수 있는 종합적인 가이드를 제공하는 앱입니다.';

  @override
  String get loading => '로딩 중...';

  @override
  String get supportPhocaive => '포카이브 응원하기🎉';

  @override
  String get webDebugMode => '웹 디버깅 모드';

  @override
  String get webNotSupported => '웹에서는 지원되지 않습니다.';

  @override
  String get mobileAppContent => '모바일 앱에서는 실제 웹 콘텐츠가 로드됩니다.';

  @override
  String storeOpenError(String storeName) {
    return '$storeName을(를) 열 수 없습니다.';
  }

  @override
  String get openInGoogleMaps => 'Google Maps에서 보기';

  @override
  String get mapLinkCopied => 'Google Maps 링크가 클립보드에 복사되었습니다';

  @override
  String get viewLink => '링크 보기';

  @override
  String get checkBtsPlaces => 'BTS 관련 장소들을 확인하세요';

  @override
  String get specialServiceForArmy => 'ARMY를 위한 특별한 서비스';

  @override
  String get phocaiveDescription1 =>
      '\'포카이브 투어\'는 방탄소년단(BTS) 멤버들이 방문했던 전 세계의 특별한 장소들을 지도와 함께 안내하는 \'ARMY\'들을 위한 서비스입니다.';

  @override
  String get phocaiveDescription2 =>
      '멤버들의 발자취를 따라 여행하며, 그들이 남긴 소중한 추억과 이야기를 발견해 보세요.';

  @override
  String get phocaiveDescription3 =>
      '지금 바로 포카이브 투어와 함께 방탄소년단(BTS) 멤버들의 흔적이 담긴 특별한 여행을 시작하세요 💜';

  @override
  String get tipRequest => '제보 요청';

  @override
  String get tipRequestMessage => '미처 담지 못한 방탄투어 정보가 있다면\n언제든 제보 부탁드립니다 🙏';

  @override
  String get phocaiveAppIntro => '포카이브 앱 소개';

  @override
  String get phocaiveServiceNote => '\'포카이브 투어\'는 \'포카이브\'에서 제공하는 서비스입니다.';

  @override
  String get phocaiveMainAppNote =>
      '\'포카이브\'는 방탄소년단(BTS) ARMY를 위한 포토카드 아카이빙 & 교환 서비스입니다. 플레이스토어 또는 앱스토어에서 \'포카이브\'를 검색해주세요.';

  @override
  String get features => '기능:';

  @override
  String get koreaGuide => '한국 가이드';

  @override
  String get usaGuide => '미국 가이드';

  @override
  String get globalGuide => '글로벌 가이드';

  @override
  String get multiLanguageSupport => '다국어 지원';

  @override
  String get version => '버전 1.0.0';

  @override
  String get downloadOnTheAppStore => '다운로드';

  @override
  String get appStore => 'App Store';

  @override
  String get getItOn => '다운로드';

  @override
  String get googlePlay => 'Google Play';

  @override
  String get testAdLoading => '테스트 광고 로딩 중...';

  @override
  String get adLoading => '광고 로딩 중...';

  @override
  String get contentLoadingError => '콘텐츠를 불러오지 못했습니다. 다시 시도해주세요.';

  @override
  String get networkConnectionError => '네트워크 연결에 실패했습니다. 인터넷 연결을 확인해주세요.';

  @override
  String get hybeBuilding => '하이브 빌딩';

  @override
  String get btsAgencyHeadquarters => 'BTS 소속사 본사';

  @override
  String get olympicStadium => '올림픽 주경기장';

  @override
  String get btsPerformanceVenue => 'BTS 공연 장소';

  @override
  String get hanRiverPark => '한강공원';

  @override
  String get popularBtsFilmingLocation => 'BTS 인기 촬영 장소';

  @override
  String get contactEmail => '@phocaive_tour / phocaive@gmail.com';
}
