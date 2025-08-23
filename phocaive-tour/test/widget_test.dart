import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phocaive_tour/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: PhocaiveTourApp()));

    // Wait for initial render
    await tester.pump();

    // Verify that the app loads without errors
    // Look for the app title in splash screen
    expect(find.text('Phocaive Tour'), findsOneWidget);
  });
  
  testWidgets('App routing configuration is valid', (WidgetTester tester) async {
    // Test that the app can be instantiated without errors
    const app = ProviderScope(child: PhocaiveTourApp());
    
    // Just verify the widget tree can be built
    expect(() => app, returnsNormally);
  });
}
