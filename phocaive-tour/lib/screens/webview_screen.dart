import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';
import '../services/admob_service.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;
  
  const WebViewScreen({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  BannerAd? _bannerAd;
  bool _isBannerAdReady = false;
  
  @override
  void initState() {
    super.initState();
    _initializeWebView();
    _loadBannerAd();
  }
  
  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView error: ${error.description}');
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            // Allow navigation within Notion domain
            if (request.url.contains('notion.site') || 
                request.url.contains('notion.so')) {
              return NavigationDecision.navigate;
            }
            // Block navigation to other domains for security
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }
  
  void _loadBannerAd() {
    if (kIsWeb) return;
    
    // Get the appropriate banner ad based on the screen
    AdType adType;
    switch (widget.title) {
      case 'Korea':
        adType = AdType.koreaBanner;
        break;
      case 'USA':
        adType = AdType.usaBanner;
        break;
      case 'Global':
        adType = AdType.globalBanner;
        break;
      default:
        adType = AdType.globalBanner;
    }
    
    _bannerAd = AdMobService.createBannerAd(adType);
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
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_getLocalizedTitle(l10n)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _controller.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // WebView
          Positioned.fill(
            bottom: _isBannerAdReady && !kIsWeb ? 60 : 0,
            child: WebViewWidget(controller: _controller),
          ),
          
          // Loading indicator
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          
          // Banner Ad at bottom
          if (_isBannerAdReady && _bannerAd != null && !kIsWeb)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
        ],
      ),
    );
  }
  
  String _getLocalizedTitle(AppLocalizations l10n) {
    switch (widget.title) {
      case 'Korea':
        return l10n.koreaMenu;
      case 'USA':
        return l10n.usaMenu;
      case 'Global':
        return l10n.globalMenu;
      default:
        return widget.title;
    }
  }
}