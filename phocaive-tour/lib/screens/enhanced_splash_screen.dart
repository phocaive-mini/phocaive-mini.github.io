import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/admob_service.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';

class EnhancedSplashScreen extends StatefulWidget {
  const EnhancedSplashScreen({super.key});

  @override
  State<EnhancedSplashScreen> createState() => _EnhancedSplashScreenState();
}

class _EnhancedSplashScreenState extends State<EnhancedSplashScreen> {
  BannerAd? _bannerAd;
  bool _isBannerAdReady = false;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _initializeBannerAd();
    _navigateToMain();
  }

  void _initializeBannerAd() {
    if (!kIsWeb) {
      _bannerAd = AdMobService.createSplashBannerAd();
      _bannerAd?.load().then((_) {
        if (mounted) {
          setState(() {
            _isBannerAdReady = true;
          });
          if (kDebugMode) {
            print('[DEBUG] Enhanced splash banner ad loaded successfully');
          }
        }
      }).catchError((error) {
        if (kDebugMode) {
          print('[DEBUG] Enhanced splash banner ad failed to load: $error');
        }
      });
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _navigationTimer?.cancel();
    super.dispose();
  }

  void _navigateToMain() {
    // 총 4초 동안 스플래시 유지
    _navigationTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) {
        context.go('/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
          // Main content area
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App logo image
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8E54E9).withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/app_icon.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF8E54E9),
                            child: const Icon(
                              Icons.photo,
                              color: Colors.white,
                              size: 60,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Phocaive Tour',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF8E54E9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)?.tourGuideSubtitle ?? 'BTS Tour Guide',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF8E54E9).withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8E54E9)),
                  ),
                ],
              ),
            ),
          ),
          // Banner ad area at the bottom
          SafeArea(
            child: Container(
              height: 60,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFE2E8F0),
                    width: 1,
                  ),
                ),
              ),
              child: !kIsWeb && _isBannerAdReady && _bannerAd != null
                  ? SizedBox(
                      width: _bannerAd!.size.width.toDouble(),
                      height: _bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: _bannerAd!),
                    )
                  : !kIsWeb
                      ? Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7FAFC),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFE2E8F0),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8B5CF6)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                AdMobService.isDebugMode ? 'Loading test ad...' : 'Loading ad...',
                                style: const TextStyle(
                                  color: Color(0xFF718096),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}