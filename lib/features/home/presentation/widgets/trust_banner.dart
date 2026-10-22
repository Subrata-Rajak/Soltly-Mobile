import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';

/// Trust and quality assurance banner highlighting Slotly's consumer guarantees.
class TrustBanner extends StatelessWidget {
  const TrustBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Container(
        padding: AppSpacing.cardPadding,
        decoration: BoxDecoration(
          color: AppColors.primaryContainer.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.shield_outlined,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'The Slotly Guarantee',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            const _GuaranteeItem(
              icon: Icons.verified_user_outlined,
              title: 'Verified Professionals',
              description: '100% background-checked and skill-evaluated technicians.',
            ),
            const SizedBox(height: AppSpacing.xs),
            const _GuaranteeItem(
              icon: Icons.price_check_rounded,
              title: 'Transparent Fixed Pricing',
              description: 'Standardized slot rates with zero unexpected overheads.',
            ),
            const SizedBox(height: AppSpacing.xs),
            const _GuaranteeItem(
              icon: Icons.update_rounded,
              title: 'Flexible Rescheduling',
              description: 'Easily modify or cancel your booking prior to technician dispatch.',
            ),
          ],
        ),
      ),
    );
  }
}

class _GuaranteeItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _GuaranteeItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.labelSmall.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                description,
                style: AppTypography.bodySmall.copyWith(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
