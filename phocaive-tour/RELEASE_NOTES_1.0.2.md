# Phocaive Tour v1.0.2 Release Notes

## 📅 Release Date: 2025-08-25

## 🎯 Version Information
- **Version**: 1.0.2
- **Build Number**: 6
- **Previous Version**: 1.0.1+5

## 📱 Build Information

### iOS Build
- **Path**: `build/ios/iphoneos/Runner.app`
- **Size**: 51.7MB
- **Status**: ✅ Successfully built
- **Team ID**: U4M6P7B738
- **Bundle ID**: com.phocaive.tour.phocaiveTour

### Android Build
- **Path**: `build/app/outputs/bundle/release/app-release.aab`
- **Size**: 44MB (AAB format)
- **Status**: ✅ Successfully built
- **Package Name**: com.phocaive.tour.phocaive_tour
- **Min SDK**: 21 (Android 5.0)

## 🆕 What's New

### Major Fixes
1. **WebView Content Loading** ✅
   - Fixed: WebView now loads actual Notion content instead of placeholder text
   - Resolved Google Play policy violation for incomplete features with active ads

2. **Complete Localization** ✅
   - Added full localization for all hardcoded text
   - Error messages now support Korean, Japanese, and English
   - Map markers display in user's language
   - Contact information properly localized

3. **Map Enhancement** ✅
   - Added BTS location markers (HYBE Building, Olympic Stadium, Han River Park)
   - Markers update dynamically based on device language

### Technical Improvements
- Removed all hardcoded text strings
- Enhanced error handling with localized messages
- Improved WebView security with domain restrictions
- Optimized font assets with tree-shaking

## 🌍 Supported Languages
- 🇰🇷 Korean (한국어)
- 🇯🇵 Japanese (日本語)
- 🇬🇧 English

## 📊 QA Validation Results
- **Code Quality**: ✅ Flutter analyze passed with no issues
- **Multilanguage Support**: ✅ Complete coverage for all UI elements
- **Ad Integration**: ✅ 7 production ad units per platform verified
- **Policy Compliance**: ✅ Google Play and iOS App Store requirements met

## 🚀 Deployment Instructions

### iOS Deployment
1. Open Xcode
2. Select Product → Archive
3. Upload to App Store Connect
4. Submit for review

### Android Deployment
1. Login to Google Play Console
2. Upload `app-release.aab` file
3. Add release notes in supported languages
4. Submit for review

## 📝 Release Notes for Store Listings

### English
**Version 1.0.2 Update**
- Fixed content loading issues in tour guides
- Improved multilanguage support
- Enhanced map with BTS location markers
- Bug fixes and performance improvements

### Korean (한국어)
**버전 1.0.2 업데이트**
- 투어 가이드 콘텐츠 로딩 문제 수정
- 다국어 지원 개선
- BTS 장소 마커가 포함된 지도 기능 향상
- 버그 수정 및 성능 개선

### Japanese (日本語)
**バージョン 1.0.2 アップデート**
- ツアーガイドのコンテンツ読み込み問題を修正
- 多言語サポートの改善
- BTS関連場所マーカー付き地図機能の強化
- バグ修正とパフォーマンスの改善

## ⚠️ Known Issues
- Minor warnings in Android build (deprecated API usage in AdMob SDK)
- These do not affect app functionality

## 🔧 Technical Details
- Flutter Version: 3.32.8
- Dart Version: 3.8.1
- Target Platforms: iOS 12.0+, Android 5.0+

## 📞 Support
- Email: phocaive@gmail.com
- Instagram: @phocaive_tour

---
*This release resolves the Google Play Store rejection issue and ensures full compliance with both Google Play and iOS App Store policies.*