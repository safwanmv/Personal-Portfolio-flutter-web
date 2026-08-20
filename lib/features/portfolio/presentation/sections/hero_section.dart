import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_links.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/mobile_device_frame.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onGetInTouch;

  const HeroSection({
    super.key,
    required this.onViewWork,
    required this.onGetInTouch,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [
                  AppColors.bgDark,
                  const Color(0xFF0D1322),
                ]
              : [
                  const Color(0xFFF1F5F9).withValues(alpha: 0.5),
                  AppColors.bgLight,
                ],
        ),
      ),
      child: Stack(
        children: [
          // Soft ambient radial glow mesh
          Positioned(
            right: -100,
            top: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                        .withValues(alpha: isDark ? 0.12 : 0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: -150,
            bottom: -150,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    (isDark ? AppColors.accentDark : AppColors.accentLight)
                        .withValues(alpha: isDark ? 0.08 : 0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: Responsive.sectionPadding(context),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextContent(context, isDark, isMobile),
                          const SizedBox(height: 48.0),
                          Center(child: _buildHeroVisual(context, isDark, isMobile)),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 12,
                            child: _buildTextContent(context, isDark, isMobile),
                          ),
                          const SizedBox(width: 48.0),
                          Expanded(
                            flex: 10,
                            child: Center(child: _buildHeroVisual(context, isDark, isMobile)),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isDark, bool isMobile) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Clean, subtle location pill badge (NO glowing green dot)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: isDark ? AppColors.badgeBgDark : AppColors.badgeBgLight,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
          ),
          child: Text(
            AppConstants.statusBadgeText,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isDark ? AppColors.badgeTextDark : AppColors.badgeTextLight,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 24.0),

        // Small Name Intro
        Text(
          AppConstants.fullName,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12.0),

        // Main Headline
        Text(
          AppConstants.heroHeadline,
          style: (isMobile
                  ? theme.textTheme.displayMedium
                  : theme.textTheme.displayLarge)
              ?.copyWith(
            height: 1.15,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 20.0),

        // Supporting Subtext
        Text(
          AppConstants.heroSubtext,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: isMobile ? 16 : 18,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32.0),

        // Primary & Secondary Action CTAs
        Wrap(
          spacing: 16.0,
          runSpacing: 12.0,
          children: [
            CustomButton(
              text: 'View My Work',
              icon: Icons.arrow_downward_rounded,
              variant: CustomButtonVariant.primary,
              onPressed: onViewWork,
            ),
            CustomButton(
              text: 'Get in Touch',
              icon: Icons.mail_outline_rounded,
              variant: CustomButtonVariant.outline,
              onPressed: onGetInTouch,
            ),
          ],
        ),
        const SizedBox(height: 32.0),

        // Quick Direct Access Links (GitHub, LinkedIn, CV) - Wrapped in Wrap to prevent overflow
        Wrap(
          spacing: 16.0,
          runSpacing: 8.0,
          children: [
            _quickLink(
              context: context,
              icon: Icons.code_rounded,
              label: 'GitHub',
              url: AppLinks.github,
            ),
            _quickLink(
              context: context,
              icon: Icons.work_outline_rounded,
              label: 'LinkedIn',
              url: AppLinks.linkedin,
            ),
            _quickLink(
              context: context,
              icon: Icons.file_download_outlined,
              label: 'CV',
              url: AppLinks.cvPath,
            ),
          ],
        ),
      ],
    );
  }

  Widget _quickLink({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String url,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      borderRadius: BorderRadius.circular(6.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16.0,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
            const SizedBox(width: 6.0),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroVisual(BuildContext context, bool isDark, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = isMobile ? (screenWidth - 40).clamp(280.0, 360.0) : 420.0;
    final containerHeight = isMobile ? 440.0 : 540.0;

    return SizedBox(
      height: containerHeight,
      width: containerWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Mobile Mockup Frame (Offset)
          Positioned(
            right: isMobile ? 0 : 20,
            top: 20,
            child: MobileDeviceFrame(
              imagePath: 'assets/images/projects/jsm/jsm_preview.png',
              title: 'JSM Mobile App',
              preset: DeviceMockupPreset.jsmScheme,
              width: isMobile ? 190 : 230,
              height: isMobile ? 380 : 460,
            ),
          ),

          // Foreground Primary Mobile Mockup Frame
          Positioned(
            left: isMobile ? 0 : 20,
            bottom: 10,
            child: MobileDeviceFrame(
              imagePath: 'assets/images/projects/field_operations/field_ops_preview.png',
              title: 'Field Operations App',
              preset: DeviceMockupPreset.fieldOps,
              width: isMobile ? 200 : 240,
              height: isMobile ? 400 : 480,
            ),
          ),
        ],
      ),
    );
  }
}
