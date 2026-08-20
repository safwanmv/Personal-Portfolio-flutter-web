import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../data/portfolio_data/experience_data.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);
    final exp = ExperienceData.currentRole;

    return Container(
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                label: 'CAREER TIMELINE',
                title: 'Professional Experience',
                subtitle:
                    'Detailed record of my full-time mobile development role and responsibilities.',
              ),
              Container(
                padding: EdgeInsets.all(isMobile ? 20.0 : 32.0),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  ),
                  boxShadow: isDark ? AppColors.cardShadowDark : AppColors.cardShadowLight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
                    Flex(
                      direction: isMobile ? Axis.vertical : Axis.horizontal,
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10.0,
                                runSpacing: 6.0,
                                children: [
                                  Text(
                                    exp.role,
                                    style: (isMobile
                                            ? theme.textTheme.titleLarge
                                            : theme.textTheme.headlineMedium)
                                        ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 3.0),
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? AppColors.badgeBgDark
                                          : AppColors.badgeBgLight,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Text(
                                      'FULL-TIME',
                                      style: theme.textTheme.labelSmall?.copyWith(
                                        color: isDark
                                            ? AppColors.badgeTextDark
                                            : AppColors.badgeTextLight,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                '${exp.company} · ${exp.location}',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: isDark
                                      ? AppColors.primaryDark
                                      : AppColors.primaryLight,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isMobile) const SizedBox(height: 12.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppColors.surfaceSubtleDark
                                : AppColors.surfaceSubtleLight,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: isDark
                                  ? AppColors.borderDark
                                  : AppColors.borderLight,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_today_rounded,
                                size: 14.0,
                                color: isDark
                                    ? AppColors.textMutedDark
                                    : AppColors.textMutedLight,
                              ),
                              const SizedBox(width: 6.0),
                              Text(
                                exp.period,
                                style: theme.textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    const Divider(),
                    const SizedBox(height: 24.0),

                    // Responsibilities list
                    Text(
                      'Key Responsibilities & Achievements:',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ...exp.responsibilities.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, right: 12.0),
                              child: Container(
                                width: 6.0,
                                height: 6.0,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? AppColors.primaryDark
                                      : AppColors.primaryLight,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
