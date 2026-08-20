import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../data/portfolio_data/education_data.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    final edu = EducationData.degree;
    final certs = EducationData.certifications;

    return Container(
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                label: 'ACADEMICS & CREDENTIALS',
                title: 'Education & Certifications',
              ),
              isMobile
                  ? Column(
                      children: [
                        _buildDegreeCard(theme, isDark, edu),
                        const SizedBox(height: 20.0),
                        _buildCertificationsCard(theme, isDark, certs),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: _buildDegreeCard(theme, isDark, edu),
                        ),
                        const SizedBox(width: 24.0),
                        Expanded(
                          flex: 1,
                          child: _buildCertificationsCard(theme, isDark, certs),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDegreeCard(
      ThemeData theme, bool isDark, dynamic edu) {
    return Container(
      padding: const EdgeInsets.all(24.0),
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
                  Icons.school_rounded,
                  size: 22.0,
                  color: isDark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight,
                ),
              ),
              const SizedBox(width: 14.0),
              Text(
                'Degree',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            edu.degree,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            edu.institution,
            style: theme.textTheme.titleSmall?.copyWith(
              color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.surfaceSubtleDark
                      : AppColors.surfaceSubtleLight,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text(
                  edu.grade,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                'Graduated ${edu.year}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isDark
                      ? AppColors.textMutedDark
                      : AppColors.textMutedLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationsCard(
      ThemeData theme, bool isDark, List<dynamic> certs) {
    return Container(
      padding: const EdgeInsets.all(24.0),
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
                  Icons.verified_rounded,
                  size: 22.0,
                  color: isDark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight,
                ),
              ),
              const SizedBox(width: 14.0),
              Text(
                'Certifications',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          ...certs.map((cert) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, right: 10.0),
                    child: Icon(
                      Icons.workspace_premium_rounded,
                      size: 18.0,
                      color: isDark
                          ? AppColors.primaryDark
                          : AppColors.primaryLight,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cert.title,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${cert.provider} · ${cert.year}',
                          style: theme.textTheme.bodySmall?.copyWith(
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
            );
          }),
        ],
      ),
    );
  }
}
