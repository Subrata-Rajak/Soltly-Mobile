import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/widgets/slotly_image.dart';
import '../../../../core/widgets/slotly_section_header.dart';
import '../../../services/domain/service_models.dart';

/// Featured Signature Care section matching the Google Stitch Home design.
/// Displays a large premium service card with hero imagery, rating badge,
/// pricing callout, duration spec, and prominent "Book Service" action button.
class FeaturedServicesSection extends StatelessWidget {
  final ServiceItem service;
  final ValueChanged<ServiceItem>? onServiceBookTap;
  final ValueChanged<ServiceItem>? onServiceCardTap;

  const FeaturedServicesSection({
    super.key,
    required this.service,
    this.onServiceBookTap,
    this.onServiceCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header: "FEATURED SIGNATURE CARE" with "Top Rated Pro" action tag
        SlotlySectionHeader(
          title: 'FEATURED SIGNATURE CARE',
          isUppercase: true,
          padding: AppSpacing.screenPadding,
          trailing: Text(
            'Top Rated Pro',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              fontSize: 12.5,
            ),
          ),
        ),
        const SizedBox(height: 6),

        // Featured Card
        Padding(
          padding: AppSpacing.screenPadding,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onServiceCardTap?.call(service),
              borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  border: Border.all(color: AppColors.border),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowMedium,
                      blurRadius: 12,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Hero Image with Floating Rating Badge
                    Stack(
                      children: [
                        SlotlyImage(
                          height: 180,
                          width: double.infinity,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(AppSpacing.radiusCard),
                          ),
                          assetPath:
                              service.imageAssetPath ??
                              'assets/images/screen.png',
                          fallbackIcon: service.icon,
                          fallbackColor: AppColors.catCleaningBg,
                          iconColor: AppColors.catCleaningIcon,
                        ),
                        // Floating Rating Badge on top left
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.95),
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusFull,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x22000000),
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  size: 15,
                                  color: AppColors.ratingAmber,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${service.rating.toStringAsFixed(1)} (${service.reviewCount}+ reviews)',
                                  style: AppTypography.badgeText.copyWith(
                                    color: AppColors.textPrimary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Card Body
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.title,
                            style: AppTypography.headlineSmall.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            service.description,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              height: 1.4,
                              fontSize: 12.5,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppSpacing.md),

                          // Price & Book Action Row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Starting from',
                                    style: AppTypography.bodySmall.copyWith(
                                      color: AppColors.textMuted,
                                      fontSize: 11,
                                      height: 1.1,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        service.formattedPrice,
                                        style: AppTypography.titleMedium
                                            .copyWith(
                                              color: AppColors.textPrimary,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20,
                                            ),
                                      ),
                                      Text(
                                        ' · ${service.formattedDuration}',
                                        style: AppTypography.bodySmall.copyWith(
                                          color: AppColors.textSecondary,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () =>
                                    onServiceBookTap?.call(service),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppSpacing.radiusSm,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Book Service',
                                  style: AppTypography.labelLarge.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
