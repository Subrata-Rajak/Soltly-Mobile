import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_typography.dart';

/// Intentional placeholder for the Bookings & Appointments section.
class BookingsScreen extends StatelessWidget {
  final VoidCallback? onScheduleTap;

  const BookingsScreen({
    super.key,
    this.onScheduleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('My Bookings'),
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
                    Icons.calendar_month_rounded,
                    size: 32,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                const Text(
                  'No Bookings Yet',
                  style: AppTypography.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Once you reserve a service slot, your appointment timeline, technician tracking, and receipts will appear here.',
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
                    'BOOKING FLOW CONNECTS IN NEXT PHASE',
                    style: AppTypography.badgeText.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 11,
                    ),
                  ),
                ),
                if (onScheduleTap != null) ...[
                  const SizedBox(height: AppSpacing.lg),
                  ElevatedButton.icon(
                    onPressed: onScheduleTap,
                    icon: const Icon(Icons.search_rounded, size: 18),
                    label: const Text('Browse Services'),
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
