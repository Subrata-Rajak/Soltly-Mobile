import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_typography.dart';
import '../../../core/constants/app_constants.dart';
import '../data/mock_home_data.dart';
import 'widgets/category_section.dart';
import 'widgets/featured_services_section.dart';
import 'widgets/home_header.dart';
import 'widgets/service_search_bar.dart';
import 'widgets/trust_banner.dart';
import 'widgets/upcoming_booking_card.dart';

/// Day 1 Home Screen for Slotly.
/// Contains brand header, search entry point, upcoming booking card (with intentional empty state),
/// category discovery row, featured services list, and trust guarantees.
class HomeScreen extends StatelessWidget {
  final VoidCallback? onExploreMoreTap;
  final VoidCallback? onBookingsTap;

  const HomeScreen({
    super.key,
    this.onExploreMoreTap,
    this.onBookingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar with branding & location
              HomeHeader(
                onLocationTap: () => _showFeedback(
                  context,
                  'Location selector will be enabled when service zones are configured.',
                ),
                onNotificationTap: () => _showFeedback(
                  context,
                  'No unread alerts. Notifications will appear here.',
                ),
              ),
              const SizedBox(height: AppSpacing.xs),

              // Hero Heading & Subtitle
              Padding(
                padding: AppSpacing.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Book trusted services\non your schedule',
                      style: AppTypography.displayLarge,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      AppConstants.appTagline,
                      style: AppTypography.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Search Bar Entry Point
              ServiceSearchBar(
                onTap: () => _showFeedback(
                  context,
                  'Search indexing will connect to service catalog in upcoming milestones.',
                ),
                onFilterTap: () => _showFeedback(
                  context,
                  'Service filters will be available with full category navigation.',
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Upcoming Booking Card (Intentional Empty State)
              UpcomingBookingCard(
                booking: MockHomeData.activeUpcomingBooking,
                onBookNowTap: () {
                  if (onExploreMoreTap != null) {
                    onExploreMoreTap!();
                  } else {
                    _showFeedback(
                      context,
                      'Select a featured service below to start your reservation.',
                    );
                  }
                },
                onViewDetailsTap: onBookingsTap,
              ),
              const SizedBox(height: AppSpacing.xl),

              // Category Discovery Row
              CategorySection(
                categories: MockHomeData.categories,
                onCategoryTap: (category) => _showFeedback(
                  context,
                  'Selected "${category.name}". Category catalog will open in Day 2.',
                ),
                onViewAllTap: onExploreMoreTap ??
                    () => _showFeedback(
                          context,
                          'Opening full category catalog...',
                        ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Featured Services Section
              FeaturedServicesSection(
                services: MockHomeData.featuredServices,
                onServiceBookTap: (service) => _showFeedback(
                  context,
                  'Selected "${service.title}" (${service.formattedPrice}). Booking flow arrives in upcoming milestones.',
                ),
                onServiceCardTap: (service) => _showFeedback(
                  context,
                  'Service detail view for "${service.title}" is planned for next phase.',
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Consumer Trust Banner
              const TrustBanner(),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }

  void _showFeedback(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
      ),
    );
  }
}
