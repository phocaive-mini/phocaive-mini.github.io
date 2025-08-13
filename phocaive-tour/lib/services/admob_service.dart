import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

enum AdType {
  splashBanner,
  mapBanner,
  koreaBanner,
  usaBanner,
  globalBanner,
  moreBanner,
  interstitial,
}

class AdMobService {
  // Debug mode flag - set to false for production
  static const bool isDebugMode = true;
  
  static String getAdUnitId(AdType adType) {
    // Use test ad unit IDs for debugging
    if (isDebugMode) {
      switch (adType) {
        case AdType.splashBanner:
        case AdType.mapBanner:
        case AdType.koreaBanner:
        case AdType.usaBanner:
        case AdType.globalBanner:
        case AdType.moreBanner:
          // Test banner ad unit ID
          return Platform.isAndroid 
              ? 'ca-app-pub-3940256099942544/6300978111'
              : 'ca-app-pub-3940256099942544/2934735716';
        case AdType.interstitial:
          // Test interstitial ad unit ID
          return Platform.isAndroid
              ? 'ca-app-pub-3940256099942544/1033173712'
              : 'ca-app-pub-3940256099942544/4411468910';
      }
    }
    
    // Production ad unit IDs
    if (Platform.isAndroid) {
      switch (adType) {
        case AdType.splashBanner:
          return 'ca-app-pub-1930793573506049/9185925495';
        case AdType.mapBanner:
          return 'ca-app-pub-1930793573506049/8228067049';
        case AdType.koreaBanner:
          return 'ca-app-pub-1930793573506049/2947820208';
        case AdType.usaBanner:
          return 'ca-app-pub-1930793573506049/4495586030';
        case AdType.globalBanner:
          return 'ca-app-pub-1930793573506049/6914985376';
        case AdType.moreBanner:
          return 'ca-app-pub-1930793573506049/6930177683';
        case AdType.interstitial:
          return 'ca-app-pub-1930793573506049/1634738536';
      }
    } else if (Platform.isIOS) {
      switch (adType) {
        case AdType.splashBanner:
          return 'ca-app-pub-1930793573506049/6388936417';
        case AdType.mapBanner:
          return 'ca-app-pub-1930793573506049/2668618605';
        case AdType.koreaBanner:
          return 'ca-app-pub-1930793573506049/6745827933';
        case AdType.usaBanner:
          return 'ca-app-pub-1930793573506049/5899650129';
        case AdType.globalBanner:
          return 'ca-app-pub-1930793573506049/5432746261';
        case AdType.moreBanner:
          return 'ca-app-pub-1930793573506049/4586568450';
        case AdType.interstitial:
          return 'ca-app-pub-1930793573506049/5573983546';
      }
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get splashBannerAdUnitId => getAdUnitId(AdType.splashBanner);

  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  static BannerAd createBannerAd(AdType adType) {
    return BannerAd(
      adUnitId: getAdUnitId(adType),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          String mode = isDebugMode ? '[TEST]' : '[PROD]';
          debugPrint('$mode ${adType.name} Banner ad loaded - ID: ${getAdUnitId(adType)}');
        },
        onAdFailedToLoad: (ad, error) {
          String mode = isDebugMode ? '[TEST]' : '[PROD]';
          debugPrint('$mode ${adType.name} Banner ad failed to load: $error');
          ad.dispose();
        },
        onAdOpened: (ad) {
          debugPrint('${adType.name} Banner ad opened');
        },
      ),
    );
  }

  static BannerAd createSplashBannerAd() {
    return createBannerAd(AdType.splashBanner);
  }

  static BannerAd createMapBannerAd() {
    return createBannerAd(AdType.mapBanner);
  }

  static BannerAd createKoreaBannerAd() {
    return createBannerAd(AdType.koreaBanner);
  }

  static BannerAd createUsaBannerAd() {
    return createBannerAd(AdType.usaBanner);
  }

  static BannerAd createGlobalBannerAd() {
    return createBannerAd(AdType.globalBanner);
  }

  static BannerAd createMoreBannerAd() {
    return createBannerAd(AdType.moreBanner);
  }

  static Future<InterstitialAd?> createInterstitialAd() async {
    InterstitialAd? interstitialAd;
    
    await InterstitialAd.load(
      adUnitId: getAdUnitId(AdType.interstitial),
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('Interstitial ad loaded');
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          debugPrint('Interstitial ad failed to load: $error');
        },
      ),
    );
    
    return interstitialAd;
  }

  static void showInterstitialAd(InterstitialAd ad) {
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        debugPrint('Interstitial ad dismissed');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('Interstitial ad failed to show: $error');
        ad.dispose();
      },
    );
    ad.show();
  }
}