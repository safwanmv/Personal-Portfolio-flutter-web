import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class ThemeToggle extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggle;

  const ThemeToggle({
    super.key,
    required this.isDark,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isDark ? 'Switch to Light Theme' : 'Switch to Dark Theme',
      child: InkWell(
        onTap: onToggle,
        borderRadius: BorderRadius.circular(24.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceSubtleDark : AppColors.badgeBgLight,
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: isDark
                  ? AppColors.borderDark
                  : AppColors.primaryLight.withValues(alpha: 0.15),
            ),
            boxShadow: isDark
                ? null
                : [
                    BoxShadow(
                      color: AppColors.primaryLight.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    )
                  ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                child: Icon(
                  isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                  key: ValueKey(isDark),
                  size: 16.0,
                  color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
                ),
              ),
              const SizedBox(width: 6.0),
              Text(
                isDark ? 'Dark' : 'Light',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.badgeTextLight,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
