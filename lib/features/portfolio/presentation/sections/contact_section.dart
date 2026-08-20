import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_links.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/section_header.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
                label: 'GET IN TOUCH',
                title: AppConstants.contactTitle,
                subtitle: AppConstants.contactSubtext,
              ),
              Container(
                padding: EdgeInsets.all(isMobile ? 24.0 : 40.0),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  ),
                  boxShadow: isDark ? AppColors.cardShadowDark : AppColors.cardShadowLight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Direct Channels & Profiles:',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final width = constraints.maxWidth;
                        int crossAxisCount = 2;
                        if (width < 700) crossAxisCount = 1;

                        return GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            mainAxisExtent: 100.0,
                          ),
                          children: [
                            _contactCard(
                              context: context,
                              isDark: isDark,
                              icon: Icons.mail_outline_rounded,
                              label: 'Email',
                              value: AppLinks.email,
                              actionLabel: 'Email Me',
                              onTap: () async {
                                final Uri uri = Uri.parse(AppLinks.emailmailto);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              },
                              onCopy: () {
                                Clipboard.setData(
                                    const ClipboardData(text: AppLinks.email));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Email address copied to clipboard!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                            ),
                            _contactCard(
                              context: context,
                              isDark: isDark,
                              icon: Icons.work_outline_rounded,
                              label: 'LinkedIn',
                              value: AppLinks.linkedinDisplay,
                              actionLabel: 'Open Profile',
                              onTap: () async {
                                final Uri uri = Uri.parse(AppLinks.linkedin);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              },
                            ),
                            _contactCard(
                              context: context,
                              isDark: isDark,
                              icon: Icons.code_rounded,
                              label: 'GitHub',
                              value: AppLinks.githubDisplay,
                              actionLabel: 'Open Repos',
                              onTap: () async {
                                final Uri uri = Uri.parse(AppLinks.github);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              },
                            ),
                            _contactCard(
                              context: context,
                              isDark: isDark,
                              icon: Icons.location_on_outlined,
                              label: 'Location',
                              value: AppConstants.location,
                              actionLabel: 'Open to Work',
                              onTap: null,
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 32.0),
                    const Divider(),
                    const SizedBox(height: 24.0),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16.0,
                        runSpacing: 12.0,
                        children: [
                          CustomButton(
                            text: 'Email Me Now',
                            icon: Icons.send_rounded,
                            variant: CustomButtonVariant.primary,
                            onPressed: () async {
                              final Uri uri = Uri.parse(AppLinks.emailmailto);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                          ),
                          CustomButton(
                            text: 'View LinkedIn',
                            icon: Icons.work_outline_rounded,
                            variant: CustomButtonVariant.outline,
                            onPressed: () async {
                              final Uri uri = Uri.parse(AppLinks.linkedin);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                          ),
                        ],
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

  Widget _contactCard({
    required BuildContext context,
    required bool isDark,
    required IconData icon,
    required String label,
    required String value,
    required String actionLabel,
    required VoidCallback? onTap,
    VoidCallback? onCopy,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isDark ? AppColors.bgDark : AppColors.bgLight,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isDark ? AppColors.badgeBgDark : AppColors.badgeBgLight,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                icon,
                size: 20.0,
                color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
              ),
            ),
            const SizedBox(width: 14.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    value,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (onCopy != null)
              IconButton(
                icon: const Icon(Icons.copy_rounded, size: 18),
                tooltip: 'Copy to Clipboard',
                onPressed: onCopy,
              )
            else if (onTap != null)
              Icon(
                Icons.arrow_outward_rounded,
                size: 18.0,
                color: isDark
                    ? AppColors.textMutedDark
                    : AppColors.textMutedLight,
              ),
          ],
        ),
      ),
    );
  }
}
