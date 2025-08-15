import 'package:flutter/material.dart';
import '../services/admob_service.dart';
import 'banner_ad_widget.dart';

class PageWithBannerAd extends StatelessWidget {
  final Widget child;
  final AdType adType;

  const PageWithBannerAd({
    super.key,
    required this.child,
    required this.adType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        BannerAdWidget(adType: adType),
      ],
    );
  }
}