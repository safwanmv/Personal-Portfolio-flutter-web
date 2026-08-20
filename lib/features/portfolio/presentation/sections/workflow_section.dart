import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/section_header.dart';

class WorkflowSection extends StatelessWidget {
  const WorkflowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final stages = [
      {
        'number': '01',
        'title': 'Understand',
        'desc':
            'Analyze business requirements, target user flows, API payloads, and offline constraints before writing code.',
      },
      {
        'number': '02',
        'title': 'Build',
        'desc':
            'Develop responsive Flutter widgets, connect state providers, and bind REST API/JSON-RPC network models.',
      },
      {
        'number': '03',
        'title': 'Handle Real-World Problems',
        'desc':
            'Engineered for token refresh, offline Hive caching, multipart image uploads, signature pads, and queued sync.',
      },
      {
        'number': '04',
        'title': 'Release and Improve',
        'desc':
            'Manage Play Store tracks, monitor Firebase Crashlytics stack traces, fix edge-case bugs, and push iterative updates.',
      },
    ];

    return Container(
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                label: 'DEVELOPMENT APPROACH',
                title: 'From idea to app',
                subtitle:
                    'How I approach building practical, production-ready cross-platform applications.',
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int crossAxisCount = 4;
                  if (width < 600) {
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
                      mainAxisExtent: 220.0,
                    ),
                    itemCount: stages.length,
                    itemBuilder: (context, index) {
                      final item = stages[index];
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
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['number']!,
                              style: theme.textTheme.displayMedium?.copyWith(
                                color: isDark
                                    ? AppColors.primaryDark.withOpacity(0.5)
                                    : AppColors.primaryLight.withOpacity(0.4),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              item['title']!,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Expanded(
                              child: Text(
                                item['desc']!,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight,
                                  height: 1.4,
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
