import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../flutter_gen/gen_l10n/app_localizations.dart';
import '../../services/admob_service.dart';
import '../../utils/url_launcher_helper.dart';
import '../../widgets/page_with_banner_ad.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PageWithBannerAd(
      adType: AdType.moreBanner,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // 메인 설명 텍스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildMainDescription(l10n),
            ),

            const SizedBox(height: 40),

            // 제보 요청 카드
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildTipRequestCard(l10n),
            ),

            const SizedBox(height: 40),

            // 포카이브 로고
            Center(child: _buildPhocaiveLogo()),

            const SizedBox(height: 32),

            // 포카이브 소개 텍스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildPhocaiveDescription(l10n),
            ),

            const SizedBox(height: 40),

            // 앱스토어 버튼들
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildStoreButtons(context, l10n),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildMainDescription(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.phocaiveDescription1,
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          l10n.phocaiveDescription2,
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF4B5563),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          l10n.phocaiveDescription3,
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF4B5563),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildTipRequestCard(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7), // Light beige/yellow
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            l10n.tipRequestMessage,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2937),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            l10n.contactEmail,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPhocaiveLogo() {
    return SvgPicture.asset(
      'assets/images/phocaive_logo_W.svg',
      height: 60,
      width: 200,
      colorFilter: const ColorFilter.mode(
        Color(0xFF8E54E9), // #8E54E9 컬러 강제 적용
        BlendMode.srcIn,
      ),
      allowDrawingOutsideViewBox: true,
      placeholderBuilder: (BuildContext context) => Container(
        height: 60,
        width: 200,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildPhocaiveDescription(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('💜', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                l10n.phocaiveServiceNote,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF1F2937),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('💜', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                l10n.phocaiveMainAppNote,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF1F2937),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStoreButtons(BuildContext context, AppLocalizations l10n) {
    // 플랫폼별로 해당 스토어 버튼만 중앙 정렬로 표시
    if (Platform.isIOS) {
      return Center(
        child: SizedBox(
          width: 200, // 버튼 너비 제한
          child: _buildAppStoreButton(context, l10n),
        ),
      );
    } else if (Platform.isAndroid) {
      return Center(
        child: SizedBox(
          width: 200, // 버튼 너비 제한
          child: _buildGooglePlayButton(context, l10n),
        ),
      );
    } else {
      // 웹이나 기타 플랫폼의 경우 둘 다 표시
      return Row(
        children: [
          Expanded(child: _buildGooglePlayButton(context, l10n)),
          const SizedBox(width: 16),
          Expanded(child: _buildAppStoreButton(context, l10n)),
        ],
      );
    }
  }

  Widget _buildGooglePlayButton(BuildContext context, AppLocalizations l10n) {
    return GestureDetector(
      onTap: () => UrlLauncherHelper.launchPlayStore(context),
      child: Image.asset(
        'assets/images/google_play_badge.png',
        height: 56,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildAppStoreButton(BuildContext context, AppLocalizations l10n) {
    return GestureDetector(
      onTap: () => UrlLauncherHelper.launchAppStore(context),
      child: SvgPicture.asset(
        'assets/images/app_store_badge.svg',
        height: 56,
        fit: BoxFit.contain,
      ),
    );
  }
}
