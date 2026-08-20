import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../data/models/project_model.dart';
import 'mobile_device_frame.dart';
import 'project_details.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final int index;

  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
  });

  DeviceMockupPreset _getPresetForProject(String id) {
    switch (id) {
      case 'field-operations':
        return DeviceMockupPreset.fieldOps;
      case 'jsm-jewellery-scheme':
        return DeviceMockupPreset.jsmScheme;
      case 'family-intelligence-platform':
        return DeviceMockupPreset.familyTree;
      default:
        return DeviceMockupPreset.generic;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);
    final isEven = index % 2 == 0;

    final preset = _getPresetForProject(project.id);

    final contentWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          decoration: BoxDecoration(
            color: isDark ? AppColors.badgeBgDark : AppColors.badgeBgLight,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            project.category.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: isDark ? AppColors.badgeTextDark : AppColors.badgeTextLight,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 12.0),

        // Confidentiality Notice
        if (project.isConfidential && project.confidentialNotice != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            margin: const EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              color: isDark ? AppColors.confBadgeBgDark : AppColors.confBadgeBgLight,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: (isDark
                        ? AppColors.confBadgeTextDark
                        : AppColors.confBadgeTextLight)
                    .withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  size: 14.0,
                  color: isDark
                      ? AppColors.confBadgeTextDark
                      : AppColors.confBadgeTextLight,
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: Text(
                    project.confidentialNotice!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.confBadgeTextDark
                          : AppColors.confBadgeTextLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        // Project Title
        Text(
          project.title,
          style: (isMobile
                  ? theme.textTheme.titleLarge
                  : theme.textTheme.headlineMedium)
              ?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12.0),

        // Short Description
        Text(
          project.shortDescription,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16.0),

        // Key Contributions Header
        Text(
          'Key Contributions & Features:',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 8.0),

        // Bullet points
        ...project.keyContributions.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3.0, right: 8.0),
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    size: 16.0,
                    color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
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
          ),
        ),
        const SizedBox(height: 20.0),

        // Technology Stack Tags
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: project.techStack.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
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
                tech,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.badgeTextLight,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24.0),

        // Action Buttons
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ProjectDetailsDialog(project: project),
                );
              },
              icon: const Icon(Icons.info_outline_rounded, size: 16),
              label: const Text('View Implementation Details'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side: BorderSide(
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                ),
              ),
            ),
            if (project.githubUrl != null) ...[
              const SizedBox(width: 12),
              IconButton(
                onPressed: () async {
                  final Uri url = Uri.parse(project.githubUrl!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                tooltip: 'View Source Code',
                icon: const Icon(Icons.code_rounded),
              ),
            ],
          ],
        ),
      ],
    );

    final visualWidget = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: MobileDeviceFrame(
          // Replace this placeholder with actual project screenshot
          imagePath: project.screenshotPath,
          title: project.title,
          preset: preset,
        ),
      ),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 56.0),
      padding: EdgeInsets.all(isMobile ? 20.0 : 32.0),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
        boxShadow: isDark ? AppColors.cardShadowDark : AppColors.cardShadowLight,
      ),
      child: isMobile
          ? Column(
              children: [
                visualWidget,
                const SizedBox(height: 24.0),
                contentWidget,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: isEven
                  ? [
                      Expanded(flex: 12, child: contentWidget),
                      const SizedBox(width: 40.0),
                      Expanded(flex: 9, child: visualWidget),
                    ]
                  : [
                      Expanded(flex: 9, child: visualWidget),
                      const SizedBox(width: 40.0),
                      Expanded(flex: 12, child: contentWidget),
                    ],
            ),
    );
  }
}
