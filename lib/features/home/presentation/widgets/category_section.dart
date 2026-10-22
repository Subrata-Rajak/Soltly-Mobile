import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../services/domain/service_models.dart';

/// Category shortcut data class mapping each Stitch category to its pastel background and icon.
class StitchCategoryItem {
  final String id;
  final String name;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  const StitchCategoryItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });
}

/// 4 service category shortcuts matching Google Stitch Home design.
/// Displays circular pastel icons (Cleaning, AC & Air, Plumbing, Electrical) with clean typography.
class CategorySection extends StatelessWidget {
  final List<ServiceCategory>? categories;
  final ValueChanged<ServiceCategory>? onCategoryTap;
  final VoidCallback? onViewAllTap;

  const CategorySection({
    super.key,
    this.categories,
    this.onCategoryTap,
    this.onViewAllTap,
  });

  static const List<StitchCategoryItem> stitchCategories = [
    StitchCategoryItem(
      id: 'cat_cleaning',
      name: 'Cleaning',
      icon: Icons.auto_awesome_rounded,
      backgroundColor: AppColors.catCleaningBg,
      iconColor: AppColors.catCleaningIcon,
    ),
    StitchCategoryItem(
      id: 'cat_ac_hvac',
      name: 'AC & Air',
      icon: Icons.air_rounded,
      backgroundColor: AppColors.catAcBg,
      iconColor: AppColors.catAcIcon,
    ),
    StitchCategoryItem(
      id: 'cat_plumbing',
      name: 'Plumbing',
      icon: Icons.water_drop_rounded,
      backgroundColor: AppColors.catPlumbingBg,
      iconColor: AppColors.catPlumbingIcon,
    ),
    StitchCategoryItem(
      id: 'cat_electrical',
      name: 'Electrical',
      icon: Icons.bolt_rounded,
      backgroundColor: AppColors.catElectricalBg,
      iconColor: AppColors.catElectricalIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: stitchCategories.map((item) {
          return _CategoryShortcutItem(
            item: item,
            onTap: () {
              final category = ServiceCategory(
                id: item.id,
                name: item.name,
                icon: item.icon,
                serviceCount: 10,
              );
              onCategoryTap?.call(category);
            },
          );
        }).toList(),
      ),
    );
  }
}

class _CategoryShortcutItem extends StatelessWidget {
  final StitchCategoryItem item;
  final VoidCallback onTap;

  const _CategoryShortcutItem({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: item.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(item.icon, size: 26, color: item.iconColor),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.name,
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
