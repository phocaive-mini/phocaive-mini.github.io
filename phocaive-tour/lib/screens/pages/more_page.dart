import 'package:flutter/material.dart';
import '../../services/admob_service.dart';
import '../../widgets/page_with_banner_ad.dart';
import '../../utils/url_launcher_helper.dart';
import '../../flutter_gen/gen_l10n/app_localizations.dart';

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
            
            // 상단 포카이브 응원하기 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildSupportButton(l10n),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
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
            Center(
              child: _buildPhocaiveLogo(),
            ),
            
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

  Widget _buildSupportButton(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF9333EA), // Purple
            Color(0xFFA855F7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9333EA).withValues(alpha: 0.3),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '포카이브 응원하기',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            '🎉',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildMainDescription(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '포카이브 투어는 방탄소년단(BTS) 멤버들이 방문했던 전 세계의 장소들을 지도와 함께 안내하는 ARMY들을 위한 서비스입니다.',
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '멤버들의 발자취를 따라 여행하여, 그들이 남긴 소중한 추억과 이야기를 발견해보세요.',
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF4B5563),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '지금 바로 포카이브 투어와 함께 방탄소년단(BTS) 멤버들의 흔적이 담긴 특별한 여행을 시작하세요',
          style: const TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF4B5563),
            fontWeight: FontWeight.w400,
          ),
        ),
        const Text(
          '💜',
          style: TextStyle(fontSize: 16),
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
            '미처 담지 못한 방탄투어 정보가 있다면',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2937),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            '언제든 제보 부탁드립니다',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2937),
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            '🙏',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Text(
            '@phocaive_tour / phocaive@gmail.com',
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF9333EA),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLogoCharacter('ㅍ'),
          _buildLogoDivider(),
          _buildLogoCharacter('ㅋ'),
          _buildLogoDivider(),
          _buildLogoCharacter('◯'),
          _buildLogoDivider(),
          _buildLogoCharacter('∨'),
        ],
      ),
    );
  }

  Widget _buildLogoCharacter(String char) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      child: Text(
        char,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF9333EA),
        ),
      ),
    );
  }

  Widget _buildLogoDivider() {
    return Container(
      width: 1,
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: const Color(0xFF9333EA),
    );
  }

  Widget _buildPhocaiveDescription(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '💜',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '포카이브 투어는 포카이브에서 제공하는 서비스입니다.',
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF1F2937),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '💜',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xFF1F2937),
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(text: '포카이브는 방탄소년단(BTS) ARMY를 위한 '),
                    TextSpan(
                      text: '포토카드 아카이빙 & 교환 서비스',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: '입니다. 플레이스토어 또는 앱스토어에서 '),
                    TextSpan(
                      text: '\'포카이브\'',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: '를 검색해주세요.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStoreButtons(BuildContext context, AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: _buildGooglePlayButton(context),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildAppStoreButton(context),
        ),
      ],
    );
  }

  Widget _buildGooglePlayButton(BuildContext context) {
    return GestureDetector(
      onTap: () => UrlLauncherHelper.launchPlayStore(context),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4285F4),
                    Color(0xFF34A853),
                    Color(0xFFFBBC05),
                    Color(0xFFEA4335),
                  ],
                ),
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GET IT ON',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Google Play',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppStoreButton(BuildContext context) {
    return GestureDetector(
      onTap: () => UrlLauncherHelper.launchAppStore(context),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.apple,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Download on the',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'App Store',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}