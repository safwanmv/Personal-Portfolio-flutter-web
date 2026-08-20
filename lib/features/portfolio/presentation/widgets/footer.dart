import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_links.dart';
import '../../../../core/utils/responsive.dart';

class Footer extends StatelessWidget {
  final VoidCallback onScrollToTop;

  const Footer({
    super.key,
    required this.onScrollToTop,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
            width: 1.0,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 64.0,
        vertical: 40.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  // Brand & Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstants.fullName,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '${AppConstants.primaryTitle} · ${AppConstants.location}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? AppColors.textMutedDark
                                : AppColors.textMutedLight,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12.0),

                  // Back to Top Button
                  IconButton.outlined(
                    onPressed: onScrollToTop,
                    tooltip: 'Back to Top',
                    icon: const Icon(Icons.arrow_upward_rounded, size: 20),
                    style: IconButton.styleFrom(
                      side: BorderSide(
                        color: isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              const Divider(),
              const SizedBox(height: 24.0),

              // Bottom Row - Wrapped in Flex & Wrap to prevent overflow
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.center,
                children: [
                  Text(
                    '© 2026 ${AppConstants.fullName}. All rights reserved.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                  if (isMobile) const SizedBox(height: 16.0),
                  Wrap(
                    alignment: isMobile ? WrapAlignment.center : WrapAlignment.end,
                    spacing: 8.0,
                    runSpacing: 6.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _footerLink(context, 'Email', AppLinks.emailmailto),
                      _footerDot(isDark),
                      _footerLink(context, 'LinkedIn', AppLinks.linkedin),
                      _footerDot(isDark),
                      _footerLink(context, 'GitHub', AppLinks.github),
                      _footerDot(isDark),
                      _footerLink(context, 'Download CV', AppLinks.cvPath),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerDot(bool isDark) {
    return Text(
      '·',
      style: TextStyle(
        color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
      ),
    );
  }

  Widget _footerLink(BuildContext context, String label, String url) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
