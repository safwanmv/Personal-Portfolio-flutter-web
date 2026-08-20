import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../utils/responsive.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? label;
  final CrossAxisAlignment alignment;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.label,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: alignment,
      children: [
        if (label != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: isDark ? AppColors.badgeBgDark : AppColors.badgeBgLight,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: (isDark ? AppColors.badgeTextDark : AppColors.badgeTextLight)
                    .withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              label!.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                color: isDark ? AppColors.badgeTextDark : AppColors.badgeTextLight,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 14.0),
        ],
        Text(
          title,
          style: (isMobile
                  ? theme.textTheme.headlineMedium
                  : theme.textTheme.displaySmall)
              ?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              subtitle!,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ),
        ],
        const SizedBox(height: 32.0),
      ],
    );
  }
}
