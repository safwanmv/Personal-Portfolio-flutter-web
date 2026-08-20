import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import 'theme_toggle.dart';

class PortfolioNavbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onToggleTheme;
  final Function(String section) onSelectSection;
  final String activeSection;

  const PortfolioNavbar({
    super.key,
    required this.onToggleTheme,
    required this.onSelectSection,
    required this.activeSection,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72.0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final bool isCompact = width < 960;

    return Container(
      height: 72.0,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withValues(alpha: 0.92),
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
            width: 1.0,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 16.0 : 40.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Display Name - Wrapped in Flexible to prevent horizontal overflow
              Flexible(
                child: InkWell(
                  onTap: () => onSelectSection('hero'),
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.primaryDark
                              : AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Center(
                          child: Text(
                            'S',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Flexible(
                        child: Text(
                          AppConstants.displayName,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (width >= 1100) ...[
                        const SizedBox(width: 6.0),
                        Flexible(
                          child: Text(
                            '· Flutter Developer',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: isDark
                                  ? AppColors.textMutedDark
                                  : AppColors.textMutedLight,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 12.0),

              // Nav Items for Desktop or Menu Icon for Mobile/Tablet
              if (!isCompact)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _navItem('About', 'about', theme, isDark),
                    _navItem('Experience', 'experience', theme, isDark),
                    _navItem('Work', 'work', theme, isDark),
                    _navItem('Skills', 'skills', theme, isDark),
                    _navItem('Contact', 'contact', theme, isDark),
                    const SizedBox(width: 12.0),
                    ThemeToggle(isDark: isDark, onToggle: onToggleTheme),
                    const SizedBox(width: 12.0),
                    ElevatedButton(
                      onPressed: () => onSelectSection('contact'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark
                            ? AppColors.primaryDark
                            : AppColors.primaryLight,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Get in Touch',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              else
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ThemeToggle(isDark: isDark, onToggle: onToggleTheme),
                    const SizedBox(width: 6.0),
                    IconButton(
                      icon: const Icon(Icons.menu_rounded, size: 28),
                      onPressed: () {
                        _showMobileMenu(context, isDark);
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String label, String key, ThemeData theme, bool isDark) {
    final isActive = activeSection == key;
    return InkWell(
      onTap: () => onSelectSection(key),
      borderRadius: BorderRadius.circular(6.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive
                ? (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                : (isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              _mobileMenuItem(context, 'About', 'about'),
              _mobileMenuItem(context, 'Experience', 'experience'),
              _mobileMenuItem(context, 'Work', 'work'),
              _mobileMenuItem(context, 'Skills', 'skills'),
              _mobileMenuItem(context, 'Contact', 'contact'),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onSelectSection('contact');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? AppColors.primaryDark
                        : AppColors.primaryLight,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Get in Touch',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _mobileMenuItem(BuildContext context, String label, String key) {
    return ListTile(
      title: Text(
        label,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      onTap: () {
        Navigator.pop(context);
        onSelectSection(key);
      },
    );
  }
}
