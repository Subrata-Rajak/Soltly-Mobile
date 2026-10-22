import 'package:flutter/material.dart';
import '../../services/domain/service_models.dart';

/// Local mock data for Day 1 UI prototyping.
/// NOTE: This data is static and fictional. It does not connect to a real backend.
abstract final class MockHomeData {
  /// Featured service categories for quick discovery
  static const List<ServiceCategory> categories = [
    ServiceCategory(
      id: 'cat_cleaning',
      name: 'Deep Cleaning',
      icon: Icons.cleaning_services_rounded,
      serviceCount: 14,
    ),
    ServiceCategory(
      id: 'cat_ac_hvac',
      name: 'AC & HVAC',
      icon: Icons.ac_unit_rounded,
      serviceCount: 8,
    ),
    ServiceCategory(
      id: 'cat_plumbing',
      name: 'Plumbing',
      icon: Icons.plumbing_rounded,
      serviceCount: 12,
    ),
    ServiceCategory(
      id: 'cat_electrical',
      name: 'Electrical',
      icon: Icons.bolt_rounded,
      serviceCount: 10,
    ),
    ServiceCategory(
      id: 'cat_appliances',
      name: 'Appliance Care',
      icon: Icons.kitchen_rounded,
      serviceCount: 9,
    ),
    ServiceCategory(
      id: 'cat_painting',
      name: 'Painting',
      icon: Icons.format_paint_rounded,
      serviceCount: 6,
    ),
  ];

  /// Curated featured services displayed on the home feed
  static const List<ServiceItem> featuredServices = [
    ServiceItem(
      id: 'srv_1',
      title: 'Full Home Deep Cleaning',
      categoryName: 'Deep Cleaning',
      rating: 4.9,
      reviewCount: 342,
      durationMinutes: 180,
      basePrice: 129,
      badgeType: ServiceBadgeType.popular,
      description:
          'Deep scrubbing, kitchen degreasing, bathroom sanitization, and dust mite treatment.',
      icon: Icons.cleaning_services_rounded,
    ),
    ServiceItem(
      id: 'srv_2',
      title: 'Inverter AC Precision Tune-Up',
      categoryName: 'AC & HVAC',
      rating: 4.8,
      reviewCount: 198,
      durationMinutes: 60,
      basePrice: 59,
      badgeType: ServiceBadgeType.topRated,
      description:
          'Pressure wash coils, refrigerant check, airflow audit, and drain pan sanitation.',
      icon: Icons.ac_unit_rounded,
    ),
    ServiceItem(
      id: 'srv_3',
      title: 'Smart Switchboard & Wiring Check',
      categoryName: 'Electrical',
      rating: 4.9,
      reviewCount: 115,
      durationMinutes: 45,
      basePrice: 45,
      badgeType: ServiceBadgeType.verified,
      description:
          'Circuit diagnostics, loose connection fixes, earthing safety, and surge inspection.',
      icon: Icons.bolt_rounded,
    ),
    ServiceItem(
      id: 'srv_4',
      title: 'Faucet Leak & Pipe Line Overhaul',
      categoryName: 'Plumbing',
      rating: 4.7,
      reviewCount: 86,
      durationMinutes: 50,
      basePrice: 49,
      badgeType: ServiceBadgeType.none,
      description:
          'High-precision leak detection, cartridge replacement, seal tightening, and pressure check.',
      icon: Icons.water_drop_rounded,
    ),
    ServiceItem(
      id: 'srv_5',
      title: 'Dual Door Refrigerator Servicing',
      categoryName: 'Appliance Care',
      rating: 4.8,
      reviewCount: 142,
      durationMinutes: 75,
      basePrice: 69,
      badgeType: ServiceBadgeType.topRated,
      description:
          'Condenser coil cleaning, thermostat recalibration, and gas level evaluation.',
      icon: Icons.kitchen_rounded,
    ),
  ];

  /// Day 1 initial state: empty upcoming booking to showcase the intentional empty state.
  static const UpcomingBooking? activeUpcomingBooking = null;

  /// Sample upcoming booking instance available for future verification or preview.
  static const UpcomingBooking sampleUpcomingBooking = UpcomingBooking(
    id: 'bk_1092',
    serviceTitle: 'Inverter AC Precision Tune-Up',
    providerName: 'Marcus Vance (Certified Tech)',
    scheduledTimeFormatted: 'Tomorrow at 10:30 AM',
    status: 'Confirmed',
    locationAddress: 'Flat 402, Oakwood Residences',
  );
}
