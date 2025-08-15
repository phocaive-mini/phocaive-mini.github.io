import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../services/admob_service.dart';
import '../../widgets/page_with_banner_ad.dart';
import '../../widgets/web_fallback_widget.dart';
import '../../utils/webview_factory.dart';
import '../../flutter_gen/gen_l10n/app_localizations.dart';

class UsaPage extends StatefulWidget {
  const UsaPage({super.key});

  @override
  State<UsaPage> createState() => _UsaPageState();
}

class _UsaPageState extends State<UsaPage> {
  late final WebViewController? controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      controller = WebViewFactory.create(
        'https://phocaive.notion.site/ebd/ec0cc5ec72fe4f15aa6a2932849ee377?v=9f1cf97ea7844f30905e4b10d9209763',
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
        title: l10n.usaMenu,
        icon: Icons.flag,
      );
    } else {
      content = WebViewWidget(controller: controller!);
    }
    
    return PageWithBannerAd(
      adType: AdType.usaBanner,
      child: content,
    );
  }
}