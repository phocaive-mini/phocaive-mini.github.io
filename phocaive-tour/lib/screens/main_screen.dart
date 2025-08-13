import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/admob_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  InterstitialAd? _interstitialAd;

  final List<Widget> _pages = [
    const MapPage(),
    const KoreaPage(),
    const UsaPage(),
    const GlobalPage(),
    const MorePage(),
  ];

  final List<String> _titles = [
    '지도',
    '한국',
    '미국',
    '글로벌',
    '더보기',
  ];

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _loadInterstitialAd();
    }
  }

  void _loadInterstitialAd() async {
    _interstitialAd = await AdMobService.createInterstitialAd();
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      AdMobService.showInterstitialAd(_interstitialAd!);
      _interstitialAd = null; // Reset ad after showing
      _loadInterstitialAd(); // Load new ad for next time
    } else {
      debugPrint('Interstitial ad not ready');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            color: Color(0xFF2D3748),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          if (!kIsWeb)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ElevatedButton(
                onPressed: _showInterstitialAd,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B5CF6),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
                child: const Text(
                  '포카이브 응원하기',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF8B5CF6),
          unselectedItemColor: const Color(0xFF9CA3AF),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.mapPin, size: 20),
              activeIcon: FaIcon(FontAwesomeIcons.mapPin, size: 20, color: Color(0xFF8B5CF6)),
              label: '지도',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.earthAsia, size: 20),
              activeIcon: FaIcon(FontAwesomeIcons.earthAsia, size: 20, color: Color(0xFF8B5CF6)),
              label: '한국',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.earthAmericas, size: 20),
              activeIcon: FaIcon(FontAwesomeIcons.earthAmericas, size: 20, color: Color(0xFF8B5CF6)),
              label: '미국',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.globe, size: 20),
              activeIcon: FaIcon(FontAwesomeIcons.globe, size: 20, color: Color(0xFF8B5CF6)),
              label: '글로벌',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_outlined),
              activeIcon: Icon(Icons.more_horiz),
              label: '더보기',
            ),
          ],
        ),
      ),
    );
  }
}

// Web fallback widget for debugging
Widget _buildWebFallback({
  required String title,
  required String description,
  required String url,
}) {
  return Container(
    padding: const EdgeInsets.all(24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF8B5CF6), Color(0xFFA855F7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(
            Icons.web,
            size: 50,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF7FAFC),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFE2E8F0),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.info_outline,
                color: Color(0xFF8B5CF6),
                size: 24,
              ),
              const SizedBox(height: 12),
              const Text(
                '웹 디버깅 모드',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '모바일 앱에서는 실제 웹 콘텐츠가 로드됩니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF718096),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Common widget for pages with banner ads
Widget _buildPageWithBannerAd({
  required Widget child,
  required AdType adType,
}) {
  return Column(
    children: [
      Expanded(child: child),
      if (!kIsWeb) _BannerAdWidget(adType: adType),
    ],
  );
}

class _BannerAdWidget extends StatefulWidget {
  final AdType adType;

  const _BannerAdWidget({required this.adType});

  @override
  State<_BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<_BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _initializeBannerAd();
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
                      AdMobService.isDebugMode ? 'TEST AD LOADING...' : 'AD LOADING...',
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

// Individual page widgets for each tab
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse('https://www.google.com/maps/d/u/0/embed?mid=1knazh0TzMvi_cR4kjZmfGwTXsK7-UbcE&ehbc=2E312F'));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (kIsWeb) {
      content = _buildWebFallback(
        title: '지도',
        description: 'BTS 관련 장소들을 확인할 수 있는 Google Maps 페이지입니다.',
        url: 'https://www.google.com/maps/d/u/0/embed?mid=1knazh0TzMvi_cR4kjZmfGwTXsK7-UbcE&ehbc=2E312F',
      );
    } else {
      content = WebViewWidget(controller: controller);
    }
    
    return _buildPageWithBannerAd(
      child: content,
      adType: AdType.mapBanner,
    );
  }
}

class KoreaPage extends StatefulWidget {
  const KoreaPage({super.key});

  @override
  State<KoreaPage> createState() => _KoreaPageState();
}

class _KoreaPageState extends State<KoreaPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse('https://www.notion.so/phocaive/7fd03246c75c450d9cb04291e4d1a67d?v=f1eeb43098c34027bafc9f4ed299d8a9'));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (kIsWeb) {
      content = _buildWebFallback(
        title: '한국',
        description: 'BTS와 관련된 한국의 특별한 장소들을 소개합니다.',
        url: 'https://www.notion.so/phocaive/7fd03246c75c450d9cb04291e4d1a67d?v=f1eeb43098c34027bafc9f4ed299d8a9',
      );
    } else {
      content = WebViewWidget(controller: controller);
    }
    
    return _buildPageWithBannerAd(
      child: content,
      adType: AdType.koreaBanner,
    );
  }
}

class UsaPage extends StatefulWidget {
  const UsaPage({super.key});

  @override
  State<UsaPage> createState() => _UsaPageState();
}

class _UsaPageState extends State<UsaPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse('https://www.notion.so/phocaive/ec0cc5ec72fe4f15aa6a2932849ee377?v=9f1cf97ea7844f30905e4b10d9209763'));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (kIsWeb) {
      content = _buildWebFallback(
        title: '미국',
        description: 'BTS가 다녀간 미국의 중요한 장소들을 둘러보세요.',
        url: 'https://www.notion.so/phocaive/ec0cc5ec72fe4f15aa6a2932849ee377?v=9f1cf97ea7844f30905e4b10d9209763',
      );
    } else {
      content = WebViewWidget(controller: controller);
    }
    
    return _buildPageWithBannerAd(
      child: content,
      adType: AdType.usaBanner,
    );
  }
}

class GlobalPage extends StatefulWidget {
  const GlobalPage({super.key});

  @override
  State<GlobalPage> createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse('https://www.notion.so/phocaive/fae7c377717a45efab5b3504cd382c39?v=f657452e62504f03877789817a30cee4'));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (kIsWeb) {
      content = _buildWebFallback(
        title: '글로벌',
        description: '전 세계 BTS 팬들이 찾는 글로벌 명소들을 만나보세요.',
        url: 'https://www.notion.so/phocaive/fae7c377717a45efab5b3504cd382c39?v=f657452e62504f03877789817a30cee4',
      );
    } else {
      content = WebViewWidget(controller: controller);
    }
    
    return _buildPageWithBannerAd(
      child: content,
      adType: AdType.globalBanner,
    );
  }
}

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPageWithBannerAd(
      adType: AdType.moreBanner,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8B5CF6), Color(0xFFA855F7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.tour,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Phocaive Tour',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'BTS Tour Guide App',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF718096),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'BTS의 발자취를 따라가며 전 세계 곳곳의 특별한 장소들을 발견해보세요. 한국, 미국, 그리고 전 세계 BTS 관련 장소들의 정보와 이야기를 담았습니다.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Color(0xFF4A5568),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF7FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE2E8F0),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '앱 정보',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('버전', '1.0.0'),
                  _buildInfoRow('개발', 'Phocaive'),
                  _buildInfoRow('문의', 'info@phocaive.com'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF718096),
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF4A5568),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}