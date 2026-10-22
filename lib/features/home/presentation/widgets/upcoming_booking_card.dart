import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../services/domain/service_models.dart';

/// Upcoming appointment card matching the Google Stitch Home design.
/// Only renders when an active [booking] is present.
class UpcomingBookingCard extends StatelessWidget {
  final UpcomingBooking? booking;
  final BookingRecord? bookingRecord;
  final VoidCallback? onViewDetailsTap;
  final VoidCallback? onBookNowTap;

  const UpcomingBookingCard({
    super.key,
    this.booking,
    this.bookingRecord,
    this.onViewDetailsTap,
    this.onBookNowTap,
  });

  @override
  Widget build(BuildContext context) {
    if (booking == null && bookingRecord == null) {
      return const SizedBox.shrink();
    }

    final title = bookingRecord?.serviceTitle ?? booking!.serviceTitle;
    final date = bookingRecord?.scheduledDateFormatted ?? 'Tomorrow, Oct 24';
    final timeAndTech = bookingRecord != null
        ? '${bookingRecord!.scheduledTimeFormatted} • ${bookingRecord!.providerName} ★ ${bookingRecord!.providerRating.toStringAsFixed(1)}'
        : '${booking!.scheduledTimeFormatted} • ${booking!.providerName} ★ 5.0';

    return Padding(
      padding: AppSpacing.screenPadding,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onViewDetailsTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
              border: Border.all(color: AppColors.border),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowSubtle,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: Blue indicator dot + UPCOMING VISIT label + Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'UPCOMING VISIT',
                          style: AppTypography.badgeText.copyWith(
                            color: AppColors.primary,
                            fontSize: 11,
                            letterSpacing: 0.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      date,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm + 2),

                // Content row: Calendar icon + Service title + Subtitle + Trailing arrow
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.calendar_month_rounded,
                        color: AppColors.primary,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTypography.titleMedium.copyWith(
                              fontSize: 15.5,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            timeAndTech,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F3F5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_right_rounded,
                        size: 20,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
