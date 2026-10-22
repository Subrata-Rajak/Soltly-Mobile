import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/widgets/slotly_image.dart';
import '../../../../core/widgets/slotly_section_header.dart';
import '../../../services/domain/service_models.dart';

/// Popular Right Now section matching Google Stitch Home design.
/// Displays high-frequency requested services as compact horizontal cards
/// with image thumbnails, ratings, transparent pricing, and forward arrows.
class PopularServicesSection extends StatelessWidget {
  final List<ServiceItem> services;
  final ValueChanged<ServiceItem>? onServiceTap;
  final VoidCallback? onSeeAllTap;

  const PopularServicesSection({
    super.key,
    required this.services,
    this.onServiceTap,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header: "Popular right now" with "See all" and subtitle
        SlotlySectionHeader(
          title: 'Popular right now',
          subtitle: 'Frequently requested by neighbors',
          actionText: 'See all',
          onActionTap: onSeeAllTap,
          padding: AppSpacing.screenPadding,
        ),
        const SizedBox(height: 8),

        // List of popular service cards
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: AppSpacing.screenPadding,
          itemCount: services.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.sm),
          itemBuilder: (context, index) {
            final service = services[index];
            return _PopularServiceCard(
              service: service,
              onTap: () => onServiceTap?.call(service),
            );
          },
        ),
      ],
    );
  }
}

class _PopularServiceCard extends StatelessWidget {
  final ServiceItem service;
  final VoidCallback onTap;

  const _PopularServiceCard({required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color fallbackBg;
    Color fallbackIconColor;

    if (service.categoryId == 'cat_ac_hvac') {
      fallbackBg = AppColors.catAcBg;
      fallbackIconColor = AppColors.catAcIcon;
    } else if (service.categoryId == 'cat_plumbing') {
      fallbackBg = AppColors.catPlumbingBg;
      fallbackIconColor = AppColors.catPlumbingIcon;
    } else if (service.categoryId == 'cat_electrical') {
      fallbackBg = AppColors.catElectricalBg;
      fallbackIconColor = AppColors.catElectricalIcon;
    } else {
      fallbackBg = AppColors.catCleaningBg;
      fallbackIconColor = AppColors.catCleaningIcon;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
            border: Border.all(color: AppColors.border),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowSubtle,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Image Thumbnail (76x76 rounded squircle)
              SlotlyImage(
                width: 76,
                height: 76,
                borderRadius: BorderRadius.circular(AppSpacing.radiusImage),
                assetPath: service.imageAssetPath,
                fallbackIcon: service.icon,
                fallbackColor: fallbackBg,
                iconColor: fallbackIconColor,
              ),
              const SizedBox(width: AppSpacing.sm + 2),

              // Middle Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rating + Specialty tag
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 14,
                          color: AppColors.ratingAmber,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          service.rating.toStringAsFixed(1),
                          style: AppTypography.labelSmall.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 11.5,
                          ),
                        ),
                        Text(
                          ' · ${service.categoryName}',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textMuted,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      service.title,
                      style: AppTypography.titleMedium.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      service.description,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 11.5,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service.formattedPrice,
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.xs),

              // Trailing Circular Action Arrow
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F3F5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
