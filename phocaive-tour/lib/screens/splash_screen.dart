import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMain();
  }

  void _navigateToMain() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Add actual logo image
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(75),
              ),
              child: const Icon(
                Icons.tour,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Phocaive Tour',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'BTS Tour Guide',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.purple.shade600,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}