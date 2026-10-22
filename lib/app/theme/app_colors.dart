import 'package:flutter/material.dart';

/// App-wide color palette for Slotly.
/// Follows a modern, restrained light theme with a refined deep blue primary accent.
abstract final class AppColors {
  // Primary Blue Accent Scale
  static const Color primary = Color(0xFF1E40AF); // Tailwind Blue 800 - professional, restrained
  static const Color primaryHover = Color(0xFF1D4ED8);
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryContainer = Color(0xFFEFF6FF); // Soft blue tint for cards and chips
  static const Color onPrimary = Colors.white;
  static const Color onPrimaryContainer = Color(0xFF1E3A8A);

  // Secondary & Accents
  static const Color secondary = Color(0xFF0F766E); // Slate teal for badges/status
  static const Color secondaryContainer = Color(0xFFCCFBF1);
  static const Color onSecondaryContainer = Color(0xFF115E59);

  // Backgrounds & Surfaces
  static const Color scaffoldBackground = Color(0xFFF8FAFC); // Slate 50
  static const Color surface = Colors.white;
  static const Color surfaceSubtle = Color(0xFFF1F5F9); // Slate 100
  static const Color cardSurface = Colors.white;

  // Text Hierarchy
  static const Color textPrimary = Color(0xFF0F172A); // Slate 900
  static const Color textSecondary = Color(0xFF475569); // Slate 600
  static const Color textMuted = Color(0xFF94A3B8); // Slate 400
  static const Color textOnPrimary = Colors.white;

  // Borders & Dividers
  static const Color border = Color(0xFFE2E8F0); // Slate 200
  static const Color borderSubtle = Color(0xFFF1F5F9); // Slate 100

  // Status & Feedback
  static const Color ratingAmber = Color(0xFFF59E0B); // Amber 500
  static const Color success = Color(0xFF16A34A); // Green 600
  static const Color successContainer = Color(0xFFDCFCE7); // Green 100
  static const Color info = Color(0xFF0284C7); // Sky 600
  static const Color infoContainer = Color(0xFFE0F2FE); // Sky 100
  static const Color warning = Color(0xFFD97706); // Amber 600
  static const Color warningContainer = Color(0xFFFEF3C7); // Amber 100
}
