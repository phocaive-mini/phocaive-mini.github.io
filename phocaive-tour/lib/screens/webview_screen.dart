import 'package:flutter/material.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;
  
  const WebViewScreen({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_getLocalizedTitle(l10n)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getRegionIcon(),
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 24),
            Text(
              _getLocalizedTitle(l10n),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '준비 중입니다...',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  IconData _getRegionIcon() {
    switch (title) {
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
  
  String _getLocalizedTitle(AppLocalizations l10n) {
    switch (title) {
      case 'Korea':
        return l10n.koreaMenu;
      case 'USA':
        return l10n.usaMenu;
      case 'Global':
        return l10n.globalMenu;
      default:
        return title;
    }
  }
}