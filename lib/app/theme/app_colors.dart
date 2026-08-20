import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Accent Color (Vibrant Indigo / Royal Blue Gradient)
  static const Color primaryLight = Color(0xFF4F46E5); // Indigo 600
  static const Color primaryDark = Color(0xFF818CF8); // Indigo 400
  static const Color primaryHoverLight = Color(0xFF4338CA); // Indigo 700
  static const Color primaryHoverDark = Color(0xFF6366F1); // Indigo 500
  static const Color accentLight = Color(0xFF2563EB); // Royal Blue 600
  static const Color accentDark = Color(0xFF38BDF8); // Sky Blue 400

  // Gradients
  static const LinearGradient primaryGradientLight = LinearGradient(
    colors: [Color(0xFF4F46E5), Color(0xFF2563EB)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient primaryGradientDark = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF38BDF8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Light Theme Colors
  static const Color bgLight = Color(0xFFF8FAFC); // Crisp slate 50
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceSubtleLight = Color(0xFFF1F5F9); // Slate 100
  static const Color borderLight = Color(0xFFE2E8F0); // Slate 200
  static const Color borderHoverLight = Color(0xFFCBD5E1); // Slate 300
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

  // Status & Badge colors
  static const Color badgeBgLight = Color(0xFFEEF2FF); // Soft indigo background
  static const Color badgeTextLight = Color(0xFF4338CA); // Deep indigo text
  static const Color badgeBgDark = Color(0xFF1E1B4B); // Deep indigo dark fill
  static const Color badgeTextDark = Color(0xFFA5B4FC); // Bright indigo light text

  // Confidential Project Badge Colors
  static const Color confBadgeBgLight = Color(0xFFFEF3C7);
  static const Color confBadgeTextLight = Color(0xFF92400E);
  static const Color confBadgeBgDark = Color(0xFF2E2207);
  static const Color confBadgeTextDark = Color(0xFFFDE68A);

  // Soft Card Shadows for Light Mode
  static const List<BoxShadow> cardShadowLight = [
    BoxShadow(
      color: Color(0x0A0F172A), // 4% slate 900
      blurRadius: 20,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x050F172A), // 2% slate 900
      blurRadius: 6,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> cardShadowHoverLight = [
    BoxShadow(
      color: Color(0x144F46E5), // 8% Indigo glow
      blurRadius: 24,
      offset: Offset(0, 8),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x0A0F172A),
      blurRadius: 10,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> cardShadowDark = [
    BoxShadow(
      color: Color(0x40000000),
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];
}
