import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _MenuCard(
              icon: Icons.map,
              title: l10n.mapMenu,
              onTap: () => context.go('/map'),
            ),
            _MenuCard(
              icon: Icons.location_on,
              title: l10n.koreaMenu,
              onTap: () => context.go('/korea'),
            ),
            _MenuCard(
              icon: Icons.flag,
              title: l10n.usaMenu,
              onTap: () => context.go('/usa'),
            ),
            _MenuCard(
              icon: Icons.public,
              title: l10n.globalMenu,
              onTap: () => context.go('/global'),
            ),
            _MenuCard(
              icon: Icons.more_horiz,
              title: l10n.moreMenu,
              onTap: () => context.go('/about'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}