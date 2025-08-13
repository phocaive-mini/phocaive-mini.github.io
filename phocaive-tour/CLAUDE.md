# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Phocaive Tour** is a Flutter mobile application that serves as a BTS (방탄소년단) tour guide, archiving and showcasing places visited by the band. The app provides an interactive map, regional guides through Notion webviews, and comprehensive multilingual support.

**Target Platforms**: Android and iOS  
**Framework**: Flutter 3.8.1+  
**Key Features**: Google Maps integration, WebView for Notion content, Multi-language support (Korean, Japanese, English)

## Development Commands

### Essential Commands
```bash
# Install dependencies
flutter pub get

# Generate localization files (if needed)
flutter gen-l10n

# Run the app in debug mode
flutter run

# Run on specific device
flutter run -d chrome          # Web
flutter run -d <device-id>      # Specific device

# Build for different platforms
flutter build apk --debug       # Android debug
flutter build apk --release     # Android release
flutter build ios              # iOS
flutter build web              # Web

# Testing
flutter test                    # Run all tests
flutter test test/widget_test.dart  # Run specific test

# Code analysis
flutter analyze                 # Static analysis
flutter doctor                  # Check development environment
```

### Development Workflow
```bash
# Start development with hot reload
flutter run --hot

# Format code
dart format lib/

# Check for outdated packages
flutter pub outdated

# Update dependencies
flutter pub upgrade
```

## Architecture Overview

### Project Structure
```
lib/
├── main.dart                   # App entry point with routing
├── screens/                    # UI screens
│   ├── splash_screen.dart      # Initial loading screen
│   ├── main_screen.dart        # Home with menu grid
│   ├── map_screen.dart         # Google Maps integration
│   ├── webview_screen.dart     # Notion content viewer
│   └── about_screen.dart       # App information
├── flutter_gen/gen_l10n/       # Generated localization files
│   ├── app_localizations.dart
│   ├── app_localizations_en.dart
│   ├── app_localizations_ko.dart
│   └── app_localizations_ja.dart
└── l10n/                       # Localization source files
    ├── app_en.arb
    ├── app_ko.arb
    └── app_ja.arb
```

### Core Dependencies
- `flutter_riverpod`: State management
- `go_router`: Navigation and routing
- `google_maps_flutter`: Interactive map functionality
- `webview_flutter`: Notion content integration
- `flutter_localizations`: Multi-language support
- `intl`: Internationalization utilities

### Navigation Architecture
The app uses GoRouter for declarative navigation with these routes:
- `/splash` → Splash screen with 2-second delay
- `/` → Main menu screen (grid layout)
- `/map` → Google Maps view
- `/korea`, `/usa`, `/global` → Notion webview screens
- `/about` → App information screen

### State Management
Uses Riverpod for reactive state management. Currently minimal state requirements, but ready for expansion.

## Localization Implementation

### Language Detection Logic
The app automatically selects language based on device system language:
- **Korean** (`ko`) → Korean interface
- **Japanese** (`ja`) → Japanese interface  
- **Default** → English interface for all other languages

### Adding New Translations
1. Add entries to ARB files in `lib/l10n/`
2. Run `flutter gen-l10n` to regenerate localization classes
3. Use `AppLocalizations.of(context)!.keyName` in widgets

### Supported Locales
- English (`en`) - Default and fallback
- Korean (`ko`) - Primary target audience
- Japanese (`ja`) - Secondary market

## External Integrations

### Google Maps
- **Implementation**: `google_maps_flutter` package
- **Usage**: Displays BTS-related locations
- **Data Source**: Custom Google Maps link provided in requirements
- **Configuration**: Requires API key setup for production builds

### Notion Integration
- **Implementation**: WebView loading Notion published pages  
- **Regional Content**:
  - Korea: BTS locations in South Korea
  - USA: BTS locations in United States  
  - Global: International BTS-related places
- **Performance**: Uses `webview_flutter` with loading states

## Configuration Requirements

### Android Setup
- Google Maps API key required in `android/app/src/main/AndroidManifest.xml`
- Internet permission already configured
- Network security config for HTTPS requests

### iOS Setup  
- Google Maps API key required in `ios/Runner/AppDelegate.swift`
- Location permissions configured in `ios/Runner/Info.plist`
- Network permissions for web content

## Testing Strategy

### Current Tests
- Widget test for app initialization and splash screen flow
- Verifies localization system loads correctly

### Testing Approach
```bash
# Run basic widget tests
flutter test

# Integration testing (future)
flutter drive --target=test_driver/app.dart
```

## Key Design Patterns

### Screen Architecture
- Stateless widgets for static content (About, Main menu)
- Stateful widgets for interactive content (Maps, WebView)
- Consistent AppBar styling across screens
- Loading states for async operations

### Error Handling
- WebView loading states with progress indicators
- Network error handling for Notion content
- Graceful fallbacks for map loading issues

### UI/UX Patterns
- Material Design 3 with purple color scheme
- Grid-based navigation on main screen
- Consistent navigation patterns
- Responsive design principles

## Common Development Tasks

### Adding New Screens
1. Create screen file in `lib/screens/`
2. Add route to GoRouter configuration in `main.dart`
3. Add navigation action from existing screens
4. Update localization files if needed

### Updating Notion URLs
- Modify URLs in GoRouter route definitions in `main.dart`
- No code changes needed beyond URL updates

### Modifying App Theme
- Update ThemeData in `main.dart`
- Consistent color scheme based on purple branding
- Material 3 design system implementation

## Performance Considerations

### WebView Optimization
- Loading indicators prevent user confusion
- Refresh functionality for failed loads
- Efficient memory management for multiple webviews

### Map Performance
- Lazy loading of map data
- Optimized marker placement
- Efficient camera positioning

## Future Enhancement Areas

- Offline map caching
- Push notifications for BTS updates
- User-generated content features
- Social sharing capabilities
- Advanced search and filtering
- Custom map markers and overlays