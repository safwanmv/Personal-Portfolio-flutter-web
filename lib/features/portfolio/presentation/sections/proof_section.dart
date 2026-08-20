import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../data/portfolio_data/profile_data.dart';

class ProofSection extends StatelessWidget {
  const ProofSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 64.0,
        vertical: 32.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'REAL-WORLD DEVELOPMENT PROOF',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
                ),
              ),
              const SizedBox(height: 16.0),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int crossAxisCount = 4;
                  if (width < 600) {
                    crossAxisCount = 1;
                  } else if (width < 960) {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      mainAxisExtent: 140.0,
                    ),
                    itemCount: ProfileData.proofItems.length,
                    itemBuilder: (context, index) {
                      final item = ProfileData.proofItems[index];
                      return Container(
                        padding: const EdgeInsets.all(20.0),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item['title']!,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: isDark
                                          ? AppColors.textPrimaryDark
                                          : AppColors.textPrimaryLight,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 6.0),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? AppColors.badgeBgDark
                                        : AppColors.badgeBgLight,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Text(
                                    item['tag']!,
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: isDark
                                          ? AppColors.badgeTextDark
                                          : AppColors.badgeTextLight,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              item['detail']!,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight,
                                height: 1.4,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
