import 'package:flutter/material.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.aboutApp),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            // App Logo
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(60),
              ),
              child: const Icon(
                Icons.tour,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            
            // App Title
            Text(
              l10n.appTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 8),
            
            // Version
            Text(
              'Version 1.0.0',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 32),
            
            // Description
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  l10n.aboutDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Features
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Features:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _FeatureItem(
                      icon: Icons.map,
                      text: l10n.mapMenu,
                    ),
                    _FeatureItem(
                      icon: Icons.location_on,
                      text: '${l10n.koreaMenu} Guide',
                    ),
                    _FeatureItem(
                      icon: Icons.flag,
                      text: '${l10n.usaMenu} Guide',
                    ),
                    _FeatureItem(
                      icon: Icons.public,
                      text: '${l10n.globalMenu} Guide',
                    ),
                    _FeatureItem(
                      icon: Icons.language,
                      text: 'Multi-language Support',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;
  
  const _FeatureItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}