import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';

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
  late final WebViewController? _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.url));
    } else {
      _controller = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_getLocalizedTitle(l10n)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          if (!kIsWeb)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => _controller?.reload(),
            ),
        ],
      ),
      body: kIsWeb 
        ? _buildWebContent(l10n)
        : _buildMobileWebView(l10n),
    );
  }
  
  Widget _buildWebContent(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getRegionIcon(),
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            _getLocalizedTitle(l10n),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'BTS ${_getLocalizedTitle(l10n)} 가이드',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _launchNotionPage(),
            icon: const Icon(Icons.open_in_new),
            label: const Text('Notion에서 보기'),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '웹 버전에서는 외부 링크로 연결됩니다.\n모바일 앱에서는 앱 내에서 바로 확인할 수 있습니다.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMobileWebView(AppLocalizations l10n) {
    return Stack(
      children: [
        if (_controller != null) WebViewWidget(controller: _controller!),
        if (_isLoading)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(l10n.loading),
              ],
            ),
          ),
      ],
    );
  }
  
  IconData _getRegionIcon() {
    switch (widget.title) {
      case 'Korea':
        return Icons.location_on;
      case 'USA':
        return Icons.flag;
      case 'Global':
        return Icons.public;
      default:
        return Icons.web;
    }
  }
  
  void _launchNotionPage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${_getLocalizedTitle(AppLocalizations.of(context)!)} 가이드 링크가 준비되었습니다'),
        action: SnackBarAction(
          label: '링크 보기',
          onPressed: () {
            // URL을 콘솔에 출력 (웹 개발자 도구에서 확인 가능)
            print('${widget.title} Notion URL: ${widget.url}');
          },
        ),
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