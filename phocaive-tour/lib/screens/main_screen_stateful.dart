import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/admob_service.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';
import 'pages/map_page.dart';
import 'pages/korea_page.dart';
import 'pages/usa_page.dart';
import 'pages/global_page.dart';
import 'pages/more_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  InterstitialAd? _headerInterstitialAd;

  final List<Widget> _pages = const [
    MapPage(),
    KoreaPage(),
    UsaPage(),
    GlobalPage(),
    MorePage(),
  ];

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _loadHeaderInterstitialAd();
    }
  }

  void _loadHeaderInterstitialAd() async {
    _headerInterstitialAd = await AdMobService.createHeaderInterstitialAd();
  }

  void _showHeaderInterstitialAd() {
    if (_headerInterstitialAd != null) {
      AdMobService.showInterstitialAd(_headerInterstitialAd!);
      _headerInterstitialAd = null;
      _loadHeaderInterstitialAd();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> _getTitles(AppLocalizations l10n) {
    return [
      l10n.mapMenu,
      l10n.koreaMenu,
      l10n.usaMenu,
      l10n.globalMenu,
      l10n.moreMenu,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final titles = _getTitles(l10n);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          titles[_selectedIndex],
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
                onPressed: _showHeaderInterstitialAd,
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
                child: Text(
                  l10n.supportPhocaive,
                  style: const TextStyle(
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
              icon: const FaIcon(FontAwesomeIcons.mapPin, size: 20),
              activeIcon: const FaIcon(FontAwesomeIcons.mapPin, size: 20, color: Color(0xFF8B5CF6)),
              label: l10n.mapMenu,
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.earthAsia, size: 20),
              activeIcon: const FaIcon(FontAwesomeIcons.earthAsia, size: 20, color: Color(0xFF8B5CF6)),
              label: l10n.koreaMenu,
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.earthAmericas, size: 20),
              activeIcon: const FaIcon(FontAwesomeIcons.earthAmericas, size: 20, color: Color(0xFF8B5CF6)),
              label: l10n.usaMenu,
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.globe, size: 20),
              activeIcon: const FaIcon(FontAwesomeIcons.globe, size: 20, color: Color(0xFF8B5CF6)),
              label: l10n.globalMenu,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.more_horiz_outlined),
              activeIcon: const Icon(Icons.more_horiz),
              label: l10n.moreMenu,
            ),
          ],
        ),
      ),
    );
  }
}