import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../services/admob_service.dart';
import '../../widgets/page_with_banner_ad.dart';
import '../../widgets/web_fallback_widget.dart';
import '../../utils/webview_factory.dart';
import '../../flutter_gen/gen_l10n/app_localizations.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final WebViewController? controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      controller = WebViewFactory.create(
        'https://www.google.com/maps/d/u/0/embed?mid=1knazh0TzMvi_cR4kjZmfGwTXsK7-UbcE&ehbc=2E312F',
      );
    } else {
      controller = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    Widget content;
    if (kIsWeb) {
      content = WebFallbackWidget(
        title: l10n.mapMenu,
        icon: Icons.map,
      );
    } else {
      content = WebViewWidget(controller: controller!);
    }
    
    return PageWithBannerAd(
      adType: AdType.mapBanner,
      child: content,
    );
  }
}