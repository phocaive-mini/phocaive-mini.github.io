import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../services/admob_service.dart';
import '../../widgets/page_with_banner_ad.dart';
import '../../widgets/web_fallback_widget.dart';
import '../../utils/webview_factory.dart';
import '../../flutter_gen/gen_l10n/app_localizations.dart';

class GlobalPage extends StatefulWidget {
  const GlobalPage({super.key});

  @override
  State<GlobalPage> createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  late final WebViewController? controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      controller = WebViewFactory.create(
        'https://phocaive.notion.site/ebd/fae7c377717a45efab5b3504cd382c39?v=f657452e62504f03877789817a30cee4',
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
        title: l10n.globalMenu,
        icon: Icons.public,
      );
    } else {
      content = WebViewWidget(controller: controller!);
    }
    
    return PageWithBannerAd(
      adType: AdType.globalBanner,
      child: content,
    );
  }
}