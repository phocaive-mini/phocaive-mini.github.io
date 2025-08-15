import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';
import 'error_handler.dart';

class UrlLauncherHelper {
  /// 안전한 URL 실행 헬퍼
  static Future<void> launchUrlSafely(
    BuildContext context,
    String url,
    String storeName,
  ) async {
    try {
      final uri = Uri.parse(url);
      
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw Exception('Cannot launch URL: $url');
      }
    } catch (e) {
      if (context.mounted) {
        ErrorHandler.handleUrlLaunchError(context, storeName, url, e);
      }
    }
  }

  /// 앱스토어 URL 실행
  static Future<void> launchAppStore(BuildContext context) async {
    const url = 'https://apps.apple.com/kr/app/%ED%8F%AC%EC%B9%B4%EC%9D%B4%EB%B8%8C-phocaive-bts-%ED%8F%AC%ED%86%A0%EC%B9%B4%EB%93%9C/id1624512192';
    final l10n = AppLocalizations.of(context)!;
    await launchUrlSafely(context, url, l10n.appStore);
  }

  /// 플레이스토어 URL 실행
  static Future<void> launchPlayStore(BuildContext context) async {
    const url = 'https://play.google.com/store/apps/details?id=com.phocaive&pcampaignid=web_share';
    final l10n = AppLocalizations.of(context)!;
    await launchUrlSafely(context, url, l10n.googlePlay);
  }
}