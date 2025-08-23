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
  DateTime? _lastButtonPress;
  
  AdNotifier() : super(AdState()) {
    if (!kIsWeb) {
      // 초기 로딩을 즉시 시작
      _loadHeaderInterstitialAd();
      // 3초 후 추가로 하나 더 로드 시도 (첫 번째가 실패한 경우)
      Future.delayed(const Duration(seconds: 3), () {
        if (state.headerInterstitialAd == null && !state.isLoading) {
          _loadHeaderInterstitialAd();
        }
      });
      // 10초 후 추가로 하나 더 로드 시도 (지속적인 실패 대비)
      Future.delayed(const Duration(seconds: 10), () {
        if (state.headerInterstitialAd == null && !state.isLoading) {
          _loadHeaderInterstitialAd();
        }
      });
    }
  }

  Future<void> _loadHeaderInterstitialAd() async {
    state = state.copyWith(isLoading: true);
    try {
      // 타임아웃 설정으로 무한 로딩 방지
      final ad = await AdMobService.createHeaderInterstitialAd()
          .timeout(const Duration(seconds: 5), onTimeout: () {
        debugPrint('Header interstitial ad loading timed out after 5 seconds');
        return null;
      });
      
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
    // 디바운스: 연속 클릭 방지 (3초)
    final now = DateTime.now();
    if (_lastButtonPress != null && 
        now.difference(_lastButtonPress!).inSeconds < 3) {
      debugPrint('Button press ignored due to debounce (less than 3 seconds)');
      return;
    }
    _lastButtonPress = now;
    
    final ad = state.headerInterstitialAd;
    if (ad != null) {
      // 광고가 준비된 경우 즉시 표시
      AdMobService.showInterstitialAd(ad);
      state = state.copyWith(headerInterstitialAd: null);
      _loadHeaderInterstitialAd(); // 다음 광고 미리 로드
      debugPrint('Header interstitial ad shown successfully');
    } else {
      // 이 경우는 버튼이 비활성화되어야 하므로 발생하지 않아야 함
      debugPrint('Warning: showHeaderInterstitialAd called but no ad available');
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