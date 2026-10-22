import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Top bar for the Home screen matching the Google Stitch design.
/// Features a location selector with map pin and down chevron on the left,
/// and a circular notification action button on the right.
class HomeHeader extends StatelessWidget {
  final VoidCallback? onLocationTap;
  final VoidCallback? onNotificationTap;
  final String locationText;

  const HomeHeader({
    super.key,
    this.onLocationTap,
    this.onNotificationTap,
    this.locationText = AppConstants.defaultLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xs + 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Location Selector Pill / Trigger
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onLocationTap,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      size: 19,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      locationText,
                      style: AppTypography.titleSmall.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.5,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Notification Bell Button
          IconButton(
            onPressed: onNotificationTap,
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const CircleBorder(
                side: BorderSide(color: AppColors.border, width: 1.0),
              ),
              padding: const EdgeInsets.all(9),
              elevation: 0,
            ),
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
