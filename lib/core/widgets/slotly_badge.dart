import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_typography.dart';

/// Reusable status and category badge for cards and tags.
/// Designed as a modern capsule pill with refined typography and soft tint surfaces.
class SlotlyBadge extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;
  final Border? border;
  final EdgeInsetsGeometry padding;

  const SlotlyBadge({
    super.key,
    required this.label,
    this.icon,
    this.backgroundColor = AppColors.primaryContainer,
    this.textColor = AppColors.onPrimaryContainer,
    this.border,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  });

  factory SlotlyBadge.popular() {
    return const SlotlyBadge(
      label: 'POPULAR',
      icon: Icons.local_fire_department_rounded,
      backgroundColor: Color(0xFFFEF3C7),
      textColor: Color(0xFFB45309),
    );
  }

  factory SlotlyBadge.topRated() {
    return const SlotlyBadge(
      label: 'TOP RATED',
      icon: Icons.star_rounded,
      backgroundColor: Color(0xFFEFF6FF),
      textColor: Color(0xFF1D4ED8),
    );
  }

  factory SlotlyBadge.verified() {
    return const SlotlyBadge(
      label: 'VERIFIED PRO',
      icon: Icons.verified_rounded,
      backgroundColor: Color(0xFFDCFCE7),
      textColor: Color(0xFF15803D),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        border: border,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppTypography.badgeText.copyWith(
              color: textColor,
              fontSize: 10.5,
            ),
          ),
        ],
      ),
    );
  }
}
