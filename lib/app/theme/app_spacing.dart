import 'package:flutter/material.dart';

/// App-wide spacing, radius, and elevation tokens for Slotly.
abstract final class AppSpacing {
  // Spacing Scale
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double xxxl = 40.0;

  // Corner Radii
  static const double radiusXs = 6.0;
  static const double radiusSm = 10.0;
  static const double radiusMd = 16.0; // Modern organic squircle curvature
  static const double radiusLg = 20.0;
  static const double radiusXl = 24.0;
  static const double radiusCard = 18.0;
  static const double radiusImage = 14.0;
  static const double radiusFull = 999.0;

  // Reusable EdgeInsets
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: 20.0,
  );
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
  static const EdgeInsets compactCardPadding = EdgeInsets.all(12.0);
  static const EdgeInsets sectionHeaderPadding = EdgeInsets.only(
    left: 20.0,
    right: 20.0,
    top: 28.0,
    bottom: 12.0,
  );
}
