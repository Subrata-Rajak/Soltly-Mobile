import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App-wide typography styles for Slotly.
/// Modern, high-contrast, accessible text hierarchy.
abstract final class AppTypography {
  static const TextStyle displayLarge = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.6,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    height: 1.25,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.1,
    height: 1.35,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.0,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    height: 1.4,
    color: AppColors.textMuted,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    color: AppColors.textSecondary,
  );

  static const TextStyle badgeText = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4,
  );

  // Editorial Serif Typography (Google Stitch Header Aesthetic)
  static const TextStyle displaySerif = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    height: 1.25,
    fontFamilyFallback: ['Georgia', 'serif'],
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineSerif = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    height: 1.3,
    fontFamilyFallback: ['Georgia', 'serif'],
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSerif = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    height: 1.35,
    fontFamilyFallback: ['Georgia', 'serif'],
    color: AppColors.textPrimary,
  );
}
