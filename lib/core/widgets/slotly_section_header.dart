import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_typography.dart';

/// Reusable section header component for Stitch screens.
/// Supports standard headings, editorial serif headings, subtitle explanations,
/// uppercase section dividers, and action buttons ("See all", "+ Add new").
class SlotlySectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? trailing;
  final bool isUppercase;
  final bool isSerif;
  final EdgeInsetsGeometry padding;

  const SlotlySectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onActionTap,
    this.trailing,
    this.isUppercase = false,
    this.isSerif = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
  });

  @override
  Widget build(BuildContext context) {
    if (isUppercase) {
      return Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toUpperCase(),
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.textMuted,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w700,
                fontSize: 11,
              ),
            ),
            if (trailing != null)
              trailing!
            else if (actionText != null)
              _buildActionButton(),
          ],
        ),
      );
    }

    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: isSerif
                      ? AppTypography.headlineSerif.copyWith(fontSize: 19)
                      : AppTypography.headlineSmall.copyWith(fontSize: 18),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    subtitle!,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null)
            trailing!
          else if (actionText != null)
            _buildActionButton(),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onActionTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            actionText!,
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
