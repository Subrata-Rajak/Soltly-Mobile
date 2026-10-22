import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_typography.dart';
import '../../services/domain/service_models.dart';
import '../data/mock_home_data.dart';
import 'widgets/category_section.dart';
import 'widgets/featured_services_section.dart';
import 'widgets/home_header.dart';
import 'widgets/popular_services_section.dart';
import 'widgets/service_search_bar.dart';
import 'widgets/trust_banner.dart';
import 'widgets/upcoming_booking_card.dart';

/// Home Screen for Slotly matching the Google Stitch visual design.
/// Features a location selector, two-tone confident headline, rounded search bar,
/// conditional upcoming booking card, 4 category shortcuts, featured signature care card,
/// popular right now service list, and Slotly happiness guarantee banner.
class HomeScreen extends StatelessWidget {
  final VoidCallback? onExploreMoreTap;
  final VoidCallback? onBookingsTap;
  final UpcomingBooking? upcomingBooking;
  final BookingRecord? upcomingBookingRecord;
  final bool hideUpcomingBooking;

  const HomeScreen({
    super.key,
    this.onExploreMoreTap,
    this.onBookingsTap,
    this.upcomingBooking,
    this.upcomingBookingRecord,
    this.hideUpcomingBooking = false,
  });

  @override
  Widget build(BuildContext context) {
    // Resolve active booking (preserves empty state if null or explicitly hidden)
    final BookingRecord? activeRecord;
    final UpcomingBooking? activeBooking;

    if (hideUpcomingBooking) {
      activeRecord = null;
      activeBooking = null;
    } else if (upcomingBookingRecord != null) {
      activeRecord = upcomingBookingRecord;
      activeBooking = upcomingBooking;
    } else if (upcomingBooking != null) {
      activeRecord = null;
      activeBooking = upcomingBooking;
    } else {
      activeRecord = MockHomeData.activeUpcomingBookingRecord;
      activeBooking = null;
    }

    final hasActiveBooking = activeRecord != null || activeBooking != null;

    // Stitch featured service (Whole Home Deep Clean)
    final featuredService = MockHomeData.allServices.first;

    // Stitch popular services (AC Seasonal Tune-Up & Drain & Faucet Repair)
    final popularServices = [
      MockHomeData.allServices.firstWhere(
        (s) => s.id == 'srv_2',
        orElse: () => MockHomeData.allServices[1],
      ),
      MockHomeData.allServices.firstWhere(
        (s) => s.id == 'srv_4',
        orElse: () => MockHomeData.allServices[3],
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar with Location Selector & Notifications
              HomeHeader(
                onLocationTap: () => _showFeedback(
                  context,
                  'Location selector: Currently serving San Francisco, CA.',
                ),
                onNotificationTap: () => _showFeedback(
                  context,
                  'No unread alerts. Notifications will appear here.',
                ),
              ),
              const SizedBox(height: 12),

              // Headline: "Your home in good hands." with "good hands." in cobalt blue
              Padding(
                padding: AppSpacing.screenPadding,
                child: Text.rich(
                  TextSpan(
                    style: AppTypography.displayLarge.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                      letterSpacing: -0.7,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Your home in\n',
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      TextSpan(
                        text: 'good hands.',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Search Bar Entry Point -> Navigates to Explore
              ServiceSearchBar(
                onTap: () {
                  if (onExploreMoreTap != null) {
                    onExploreMoreTap!();
                  } else {
                    context.go('/explore');
                  }
                },
                onFilterTap: () => context.go('/explore'),
              ),
              const SizedBox(height: 20),

              // Upcoming Visit Card (Only shown when an active booking exists)
              if (hasActiveBooking) ...[
                UpcomingBookingCard(
                  booking: activeBooking,
                  bookingRecord: activeRecord,
                  onViewDetailsTap: () {
                    if (onBookingsTap != null) {
                      onBookingsTap!();
                    } else {
                      context.go('/bookings');
                    }
                  },
                ),
                const SizedBox(height: 22),
              ],

              // 4 Category Shortcuts Row
              CategorySection(
                onCategoryTap: (category) {
                  context.go('/explore?category=${category.id}');
                },
                onViewAllTap: () => context.go('/explore'),
              ),
              const SizedBox(height: 24),

              // Featured Signature Care Card
              FeaturedServicesSection(
                service: featuredService,
                onServiceBookTap: (service) {
                  context.push('/services/${service.id}');
                },
                onServiceCardTap: (service) {
                  context.push('/services/${service.id}');
                },
              ),
              const SizedBox(height: 24),

              // Popular Right Now Horizontal Rows
              PopularServicesSection(
                services: popularServices,
                onServiceTap: (service) {
                  context.push('/services/${service.id}');
                },
                onSeeAllTap: () => context.go('/explore'),
              ),
              const SizedBox(height: 24),

              // Slotly Happiness Guarantee Banner
              const TrustBanner(),
              const SizedBox(height: 70),
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
