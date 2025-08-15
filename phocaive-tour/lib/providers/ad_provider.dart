import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/admob_service.dart';

// 광고 관련 상태 관리
class AdState {
  final InterstitialAd? headerInterstitialAd;
  final bool isLoading;

  AdState({
    this.headerInterstitialAd,
    this.isLoading = false,
  });

  AdState copyWith({
    InterstitialAd? headerInterstitialAd,
    bool? isLoading,
  }) {
    return AdState(
      headerInterstitialAd: headerInterstitialAd ?? this.headerInterstitialAd,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AdNotifier extends StateNotifier<AdState> {
  AdNotifier() : super(AdState()) {
    if (!kIsWeb) {
      _loadHeaderInterstitialAd();
    }
  }

  Future<void> _loadHeaderInterstitialAd() async {
    state = state.copyWith(isLoading: true);
    try {
      final ad = await AdMobService.createHeaderInterstitialAd();
      state = state.copyWith(
        headerInterstitialAd: ad,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      debugPrint('Failed to load header interstitial ad: $e');
    }
  }

  void showHeaderInterstitialAd() {
    final ad = state.headerInterstitialAd;
    if (ad != null) {
      AdMobService.showInterstitialAd(ad);
      state = state.copyWith(headerInterstitialAd: null);
      _loadHeaderInterstitialAd(); // 다음 광고 미리 로드
    }
  }

  @override
  void dispose() {
    state.headerInterstitialAd?.dispose();
    super.dispose();
  }
}

final adProvider = StateNotifierProvider<AdNotifier, AdState>((ref) {
  return AdNotifier();
});