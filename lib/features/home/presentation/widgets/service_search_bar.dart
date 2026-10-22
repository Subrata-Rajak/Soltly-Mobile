import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Pill search bar component matching Google Stitch Home design.
/// Features a rounded pill container, search icon, hint text, and filter action icon.
class ServiceSearchBar extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onFilterTap;
  final ValueChanged<String>? onChanged;

  const ServiceSearchBar({
    super.key,
    this.onTap,
    this.onFilterTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F3F5),
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search_rounded,
                  color: AppColors.textMuted,
                  size: 21,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    AppConstants.homeSearchHint,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                InkWell(
                  onTap: onFilterTap ?? onTap,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: const Icon(
                      Icons.tune_rounded,
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
