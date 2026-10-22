import 'package:flutter/material.dart';

/// App-wide color palette for Slotly.
/// Follows a modern, premium light-only theme with warm off-white surfaces,
/// deep navy typography, and a cobalt blue primary action accent.
abstract final class AppColors {
  // Primary Cobalt Blue
  static const Color primary = Color(
    0xFF1D4ED8,
  ); // Cobalt Blue 700 - confident & accessible
  static const Color primaryHover = Color(0xFF1E40AF);
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryContainer = Color(0xFFEFF6FF); // Soft ice-blue tint
  static const Color onPrimary = Colors.white;
  static const Color onPrimaryContainer = Color(0xFF1E3A8A);

  // Secondary Accents
  static const Color secondary = Color(0xFF0F766E); // Teal accent
  static const Color secondaryContainer = Color(0xFFCCFBF1);
  static const Color onSecondaryContainer = Color(0xFF115E59);

  // Warm Off-White Surfaces & Backgrounds
  static const Color scaffoldBackground = Color(
    0xFFF9FAFB,
  ); // Warm neutral off-white
  static const Color surface = Colors.white;
  static const Color surfaceSubtle = Color(0xFFF3F4F6); // Soft grey container
  static const Color surfaceElevated = Colors.white;
  static const Color cardSurface = Colors.white;

  // Deep Navy Text Hierarchy
  static const Color textPrimary = Color(0xFF0F172A); // Deep Slate Navy
  static const Color textSecondary = Color(0xFF475569); // Slate 600
  static const Color textMuted = Color(
    0xFF64748B,
  ); // Slate 500 - improved contrast
  static const Color textOnPrimary = Colors.white;

  // Soft Borders & Subtle Dividers
  static const Color border = Color(0xFFE5E7EB); // Soft neutral border
  static const Color borderSubtle = Color(0xFFF1F5F9); // Very light divider

  // Shadows
  static const Color shadowSubtle = Color(0x0A000000); // 4% black
  static const Color shadowMedium = Color(0x14000000); // 8% black

  // Status & Feedback Accents
  static const Color ratingAmber = Color(0xFFF59E0B); // Amber 500
  static const Color success = Color(0xFF10B981); // Emerald Green
  static const Color successContainer = Color(0xFFECFDF5); // Emerald tint
  static const Color info = Color(0xFF0284C7); // Sky 600
  static const Color infoContainer = Color(0xFFE0F2FE); // Sky 100
  static const Color warning = Color(0xFFD97706); // Amber 600
  static const Color warningContainer = Color(0xFFFEF3C7); // Amber 100
}
