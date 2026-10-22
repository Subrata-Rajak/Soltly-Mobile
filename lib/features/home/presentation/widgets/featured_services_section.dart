import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../services/domain/service_models.dart';
import 'service_card.dart';

/// Featured services section showing popular services on the home feed.
class FeaturedServicesSection extends StatelessWidget {
  final List<ServiceItem> services;
  final ValueChanged<ServiceItem>? onServiceBookTap;
  final ValueChanged<ServiceItem>? onServiceCardTap;

  const FeaturedServicesSection({
    super.key,
    required this.services,
    this.onServiceBookTap,
    this.onServiceCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Featured Services',
                      style: AppTypography.headlineSmall,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Top-rated specialists ready for your booking',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textMuted,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
                ),
                child: Text(
                  '${services.length} AVAILABLE',
                  style: AppTypography.badgeText.copyWith(
                    color: AppColors.primary,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          itemCount: services.length,
          separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (context, index) {
            final service = services[index];
            return ServiceCard(
              service: service,
              onBookTap: () => onServiceBookTap?.call(service),
              onCardTap: () => onServiceCardTap?.call(service),
            );
          },
        ),
      ],
    );
  }
}
