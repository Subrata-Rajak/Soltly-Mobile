import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';

/// Reusable image container component that provides a unified imagery strategy for Slotly.
/// Supports local assets with automatic error-handling, standardized aspect ratios,
/// rounded squircle clipping, and graceful fallback illustrations when photo assets are pending.
class SlotlyImage extends StatelessWidget {
  final String? assetPath;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final IconData fallbackIcon;
  final Color? fallbackColor;
  final Color? iconColor;

  const SlotlyImage({
    super.key,
    this.assetPath,
    this.width,
    this.height,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.fallbackIcon = Icons.home_repair_service_rounded,
    this.fallbackColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveRadius =
        borderRadius ?? BorderRadius.circular(AppSpacing.radiusImage);

    return ClipRRect(
      borderRadius: effectiveRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (assetPath != null && assetPath!.trim().isNotEmpty) {
      return Image.asset(
        assetPath!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildFallback(context),
      );
    }
    return _buildFallback(context);
  }

  Widget _buildFallback(BuildContext context) {
    final effectiveBg = fallbackColor ?? AppColors.primaryContainer;
    final effectiveIconColor = iconColor ?? AppColors.primary;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: effectiveBg,
        gradient: LinearGradient(
          colors: [effectiveBg, effectiveBg.withValues(alpha: 0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Icon(
          fallbackIcon,
          color: effectiveIconColor,
          size: (height != null && height! < 60) ? 24 : 32,
        ),
      ),
    );
  }
}
