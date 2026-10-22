import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_typography.dart';

/// Reusable intentional empty state component for Stitch screens.
/// Features a soft concentric circular icon badge, editorial serif title,
/// helpful explanation copy, optional reassurance cards, and a primary CTA.
class SlotlyEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onActionTap;
  final IconData? actionIcon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final bool isSerifTitle;
  final Widget? extraContent;
  final EdgeInsetsGeometry padding;

  const SlotlyEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onActionTap,
    this.actionIcon,
    this.iconColor,
    this.iconBackgroundColor,
    this.isSerifTitle = true,
    this.extraContent,
    this.padding = const EdgeInsets.all(24.0),
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? AppColors.primary;
    final effectiveIconBg = iconBackgroundColor ?? AppColors.primaryContainer;

    return Center(
      child: SingleChildScrollView(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular concentric icon container
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: effectiveIconBg.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: effectiveIconBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 28, color: effectiveIconColor),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: isSerifTitle
                  ? AppTypography.displaySerif.copyWith(fontSize: 24)
                  : AppTypography.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.xs + 2),

            // Description
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.45,
                ),
              ),
            ),

            if (extraContent != null) ...[
              const SizedBox(height: AppSpacing.lg),
              extraContent!,
            ],

            if (actionLabel != null) ...[
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onActionTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSpacing.radiusSm + 2,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        actionLabel!,
                        style: AppTypography.labelLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (actionIcon != null) ...[
                        const SizedBox(width: 6),
                        Icon(actionIcon, size: 18, color: Colors.white),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
