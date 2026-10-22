import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_typography.dart';

/// Intentional placeholder for the Explore / Service Directory section.
class ExploreScreen extends StatelessWidget {
  final VoidCallback? onBackToHomeTap;

  const ExploreScreen({
    super.key,
    this.onBackToHomeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Explore Services'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: AppSpacing.screenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.explore_rounded,
                    size: 32,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                const Text(
                  'Service Directory',
                  style: AppTypography.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Browse full category listings, filter by price and availability, and find specialists in your neighborhood.',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceSubtle,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    'PLANNED FOR DAY 2 MILESTONE',
                    style: AppTypography.badgeText.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 11,
                    ),
                  ),
                ),
                if (onBackToHomeTap != null) ...[
                  const SizedBox(height: AppSpacing.lg),
                  ElevatedButton.icon(
                    onPressed: onBackToHomeTap,
                    icon: const Icon(Icons.home_rounded, size: 18),
                    label: const Text('Back to Home'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
