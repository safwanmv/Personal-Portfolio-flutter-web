import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Restrained Accent Color (Sophisticated Blue / Cyan-Blue)
  static const Color primaryLight = Color(0xFF0284C7); // Sky Blue 600
  static const Color primaryDark = Color(0xFF38BDF8); // Sky Blue 400
  static const Color primaryHoverLight = Color(0xFF0369A1);
  static const Color primaryHoverDark = Color(0xFF0EA5E9);

  // Light Theme Colors
  static const Color bgLight = Color(0xFFF8FAFC); // Slate 50
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceSubtleLight = Color(0xFFF1F5F9); // Slate 100
  static const Color borderLight = Color(0xFFE2E8F0); // Slate 200
  static const Color textPrimaryLight = Color(0xFF0F172A); // Slate 900
  static const Color textSecondaryLight = Color(0xFF475569); // Slate 600
  static const Color textMutedLight = Color(0xFF64748B); // Slate 500

  // Dark Theme Colors
  static const Color bgDark = Color(0xFF090D16); // Deep charcoal near-black
  static const Color surfaceDark = Color(0xFF111827); // Gray 900
  static const Color surfaceSubtleDark = Color(0xFF1E293B); // Slate 800
  static const Color borderDark = Color(0xFF1E293B); // Slate 800
  static const Color textPrimaryDark = Color(0xFFF8FAFC); // Slate 50
  static const Color textSecondaryDark = Color(0xFF94A3B8); // Slate 400
  static const Color textMutedDark = Color(0xFF64748B); // Slate 500

  // Status & Badge colors (Subtle, non-glowing)
  static const Color badgeBgLight = Color(0xFFE0F2FE);
  static const Color badgeTextLight = Color(0xFF0369A1);
  static const Color badgeBgDark = Color(0xFF032B45);
  static const Color badgeTextDark = Color(0xFF7DD3FC);

  // Confidential Project Badge Colors
  static const Color confBadgeBgLight = Color(0xFFFEF3C7);
  static const Color confBadgeTextLight = Color(0xFF92400E);
  static const Color confBadgeBgDark = Color(0xFF2E2207);
  static const Color confBadgeTextDark = Color(0xFFFDE68A);
}
