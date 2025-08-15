import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phocaive_tour/main.dart';

void main() {
  testWidgets('App loads without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: PhocaiveTourApp()));

    // Wait for splash screen to load
    await tester.pump();

    // Verify that splash screen loads
    expect(find.text('Phocaive Tour'), findsOneWidget);

    // Wait for navigation timer and proceed to main screen
    await tester.pump(const Duration(seconds: 3));

    // Since WebView may cause issues in tests, just verify basic structure
    // Check for app bar which should be present in main screen
    expect(find.byType(AppBar), findsOneWidget);
  });
}
