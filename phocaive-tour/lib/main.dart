import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'screens/splash_screen.dart';
import 'screens/main_screen.dart';
import 'screens/map_screen.dart';
import 'screens/webview_screen.dart';
import 'screens/about_screen.dart';
import 'services/admob_service.dart';
import 'flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize AdMob only on mobile platforms
  if (!kIsWeb) {
    await AdMobService.initialize();
  }
  
  runApp(const ProviderScope(child: PhocaiveTourApp()));
}

class PhocaiveTourApp extends StatelessWidget {
  const PhocaiveTourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Phocaive Tour',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5CF6),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF2D3748),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Color(0xFF2D3748),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF8B5CF6),
          unselectedItemColor: Color(0xFF9CA3AF),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ko'),
        Locale('ja'),
      ],
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/map',
      builder: (context, state) => const MapScreen(),
    ),
    GoRoute(
      path: '/korea',
      builder: (context, state) => const WebViewScreen(
        url: 'https://www.notion.so/phocaive/7fd03246c75c450d9cb04291e4d1a67d?v=f1eeb43098c34027bafc9f4ed299d8a9',
        title: 'Korea',
      ),
    ),
    GoRoute(
      path: '/usa',
      builder: (context, state) => const WebViewScreen(
        url: 'https://www.notion.so/phocaive/ec0cc5ec72fe4f15aa6a2932849ee377?v=9f1cf97ea7844f30905e4b10d9209763',
        title: 'USA',
      ),
    ),
    GoRoute(
      path: '/global',
      builder: (context, state) => const WebViewScreen(
        url: 'https://www.notion.so/phocaive/fae7c377717a45efab5b3504cd382c39?v=f657452e62504f03877789817a30cee4',
        title: 'Global',
      ),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
  ],
);