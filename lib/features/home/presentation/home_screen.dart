import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

/// Home Screen for Slotly.
/// Contains brand header, search entry point, upcoming booking card (with intentional empty state),
/// category discovery row, featured services list, and trust guarantees.
class HomeScreen extends StatelessWidget {
  final VoidCallback? onExploreMoreTap;
  final VoidCallback? onBookingsTap;

  const HomeScreen({super.key, this.onExploreMoreTap, this.onBookingsTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
              const SizedBox(height: AppSpacing.sm),

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
                    const SizedBox(height: 6),
                    Text(
                      AppConstants.appTagline,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 14.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md + 2),

              // Search Bar Entry Point -> Navigates to Explore
              ServiceSearchBar(
                onTap: () => context.go('/explore'),
                onFilterTap: () => context.go('/explore'),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Upcoming Booking Card (Intentional Empty State)
              UpcomingBookingCard(
                booking: MockHomeData.activeUpcomingBooking,
                onBookNowTap: () {
                  if (onExploreMoreTap != null) {
                    onExploreMoreTap!();
                  } else {
                    context.go('/explore');
                  }
                },
                onViewDetailsTap: () {
                  if (onBookingsTap != null) {
                    onBookingsTap!();
                  } else {
                    context.go('/bookings');
                  }
                },
              ),
              const SizedBox(height: 28),

              // Category Discovery Row -> Navigates to Explore with Category Filter
              CategorySection(
                categories: MockHomeData.categories,
                onCategoryTap: (category) {
                  context.go('/explore?category=${category.id}');
                },
                onViewAllTap: () => context.go('/explore'),
              ),
              const SizedBox(height: 28),

              // Featured Services Section -> Opens Service Detail
              FeaturedServicesSection(
                services: MockHomeData.featuredServices,
                onServiceBookTap: (service) {
                  context.push('/services/${service.id}');
                },
                onServiceCardTap: (service) {
                  context.push('/services/${service.id}');
                },
              ),
              const SizedBox(height: 28),

              // Consumer Trust Banner
              const TrustBanner(),
              const SizedBox(height: AppSpacing.xxxl),
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
