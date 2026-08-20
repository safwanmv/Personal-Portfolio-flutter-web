import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../data/portfolio_data/skills_data.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                label: 'TECHNICAL SKILLS',
                title: 'Technologies & Frameworks',
                subtitle:
                    'Practical tools, architectures, and libraries I use to build mobile products.',
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int crossAxisCount = 3;
                  if (width < 700) {
                    crossAxisCount = 1;
                  } else if (width < 1024) {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: width < 700 ? 1.35 : 1.15,
                    ),
                    itemCount: SkillsData.categories.length,
                    itemBuilder: (context, index) {
                      final category = SkillsData.categories[index];
                      return Container(
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.surfaceDark
                              : AppColors.surfaceLight,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: isDark
                                ? AppColors.borderDark
                                : AppColors.borderLight,
                          ),
                          boxShadow: isDark ? AppColors.cardShadowDark : AppColors.cardShadowLight,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? AppColors.badgeBgDark
                                        : AppColors.badgeBgLight,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Icon(
                                    category.icon,
                                    size: 22.0,
                                    color: isDark
                                        ? AppColors.primaryDark
                                        : AppColors.primaryLight,
                                  ),
                                ),
                                const SizedBox(width: 14.0),
                                Expanded(
                                  child: Text(
                                    category.title,
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: isDark
                                          ? AppColors.textPrimaryDark
                                          : AppColors.textPrimaryLight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18.0),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  children: category.skills.map((skill) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 6.0),
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? AppColors.surfaceSubtleDark
                                            : AppColors.badgeBgLight,
                                        borderRadius: BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: isDark
                                              ? AppColors.borderDark
                                              : AppColors.primaryLight.withValues(alpha: 0.15),
                                        ),
                                      ),
                                      child: Text(
                                        skill,
                                        style:
                                            theme.textTheme.labelMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: isDark
                                              ? AppColors.textPrimaryDark
                                              : AppColors.badgeTextLight,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
