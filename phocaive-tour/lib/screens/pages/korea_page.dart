import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../services/admob_service.dart';
import '../../widgets/page_with_banner_ad.dart';
import '../../widgets/web_fallback_widget.dart';
import '../../utils/webview_factory.dart';
import '../../flutter_gen/gen_l10n/app_localizations.dart';

class KoreaPage extends StatefulWidget {
  const KoreaPage({super.key});

  @override
  State<KoreaPage> createState() => _KoreaPageState();
}

class _KoreaPageState extends State<KoreaPage> {
  late final WebViewController? controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      controller = WebViewFactory.create(
        'https://phocaive.notion.site/ebd/7fd03246c75c450d9cb04291e4d1a67d?v=f1eeb43098c34027bafc9f4ed299d8a9',
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
        title: l10n.koreaMenu,
        icon: Icons.location_on,
      );
    } else {
      content = WebViewWidget(controller: controller!);
    }
    
    return PageWithBannerAd(
      adType: AdType.koreaBanner,
      child: content,
    );
  }
}