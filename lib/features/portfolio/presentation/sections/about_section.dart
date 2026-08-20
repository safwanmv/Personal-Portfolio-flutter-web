import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                label: 'BACKGROUND',
                title: 'A little about me',
              ),
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextContent(theme, isDark),
                        const SizedBox(height: 32.0),
                        _buildCardsGrid(context, isDark),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 12,
                          child: _buildTextContent(theme, isDark),
                        ),
                        const SizedBox(width: 48.0),
                        Expanded(
                          flex: 10,
                          child: _buildCardsGrid(context, isDark),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent(ThemeData theme, bool isDark) {
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
      height: 1.6,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppConstants.aboutText1, style: textStyle),
        const SizedBox(height: 16.0),
        Text(AppConstants.aboutText2, style: textStyle),
        const SizedBox(height: 16.0),
        Text(AppConstants.aboutText3, style: textStyle),
      ],
    );
  }

  Widget _buildCardsGrid(BuildContext context, bool isDark) {
    final theme = Theme.of(context);

    final principles = [
      {
        'icon': Icons.phonelink_setup_rounded,
        'title': 'Production Mindset',
        'desc': 'Focusing on error boundaries, crash tracking, and user feedback over quick hacks.',
      },
      {
        'icon': Icons.offline_bolt_outlined,
        'title': 'Offline-First Logic',
        'desc': 'Designing Hive local boxes & background sync queues for spotty cellular connectivity.',
      },
      {
        'icon': Icons.sync_alt_rounded,
        'title': 'API Interceptors & Auth',
        'desc': 'Handling JWT tokens, refresh flows, and JSON-RPC protocols seamlessly.',
      },
      {
        'icon': Icons.system_update_alt_rounded,
        'title': 'Release & Maintenance',
        'desc': 'Managing Play Store tracks, App Bundles, and Firebase Crashlytics monitoring.',
      },
    ];

    return Column(
      children: principles.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.badgeBgDark : AppColors.badgeBgLight,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  size: 20.0,
                  color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
                ),
              ),
              const SizedBox(width: 14.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'] as String,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      item['desc'] as String,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
