import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';

class ErrorHandler {
  /// URL 실행 에러 처리
  static void handleUrlLaunchError(
    BuildContext context,
    String storeName,
    String url,
    Object error,
  ) {
    if (!context.mounted) return;
    
    final l10n = AppLocalizations.of(context)!;
    
    // 에러 로깅 (개발 모드에서만)
    if (kDebugMode) {
      debugPrint('Failed to launch URL: $url');
      debugPrint('Error: $error');
    }
    
    // 사용자에게 친화적인 에러 메시지 표시
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.storeOpenError(storeName)),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  /// WebView 로딩 에러 처리
  static void handleWebViewError(
    BuildContext context,
    String url,
    Object error,
  ) {
    if (!context.mounted) return;
    
    // 에러 로깅
    if (kDebugMode) {
      debugPrint('WebView loading error for URL: $url');
      debugPrint('Error: $error');
    }
    
    // 사용자에게 알림 (선택적)
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.contentLoadingError),
        backgroundColor: Colors.orange,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// 광고 로딩 에러 처리
  static void handleAdLoadError(String adType, Object error) {
    if (kDebugMode) {
      debugPrint('Ad loading error for $adType: $error');
    }
    // 광고 에러는 사용자에게 노출하지 않음 (UX 방해하지 않음)
  }

  /// 일반적인 네트워크 에러 처리
  static void handleNetworkError(BuildContext context) {
    if (!context.mounted) return;
    
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.networkConnectionError),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}