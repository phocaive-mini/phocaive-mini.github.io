import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/admob_service.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';

class BannerAdWidget extends StatefulWidget {
  final AdType adType;

  const BannerAdWidget({
    super.key,
    required this.adType,
  });

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _initializeBannerAd();
    }
  }

  void _initializeBannerAd() {
    _bannerAd = AdMobService.createBannerAd(widget.adType);
    _bannerAd?.load().then((_) {
      if (mounted) {
        setState(() {
          _isBannerAdReady = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const SizedBox.shrink();
    }

    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
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
        child: _isBannerAdReady && _bannerAd != null
            ? SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              )
            : Container(
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
                    const Icon(
                      Icons.ads_click,
                      color: Color(0xFF8B5CF6),
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AdMobService.isDebugMode ? l10n.testAdLoading : l10n.adLoading,
                      style: const TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}