import 'package:flutter/material.dart';
import '../../services/domain/service_models.dart';

/// Local mock repository for Day 1 and Day 2 prototyping.
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

  /// Comprehensive service catalogue for the Explore screen and details
  static const List<ServiceItem> allServices = [
    ServiceItem(
      id: 'srv_1',
      title: 'Full Home Deep Cleaning',
      categoryId: 'cat_cleaning',
      categoryName: 'Deep Cleaning',
      rating: 4.9,
      reviewCount: 342,
      durationMinutes: 180,
      basePrice: 129,
      badgeType: ServiceBadgeType.popular,
      description:
          'Comprehensive multi-room sanitization, kitchen grease removal, bathroom descaling, balcony washing, and hospital-grade floor scrubbing.',
      icon: Icons.cleaning_services_rounded,
      providerName: 'Apex Clean Pro Crew',
      providerExperience: '5+ years verified • 1,200+ jobs',
      isVerified: true,
      imageAssetPath: 'assets/images/screen.png',
      inclusions: [
        'Complete kitchen countertop, chimney exterior & cabinet degreasing',
        'Deep sanitization and anti-scale descaling of all bathrooms',
        'Dry dusting and mechanical vacuuming of upholstered furniture',
        'Machine buffing and wet scrubbing of tiled floors',
        'Window panes, grilles, and balcony wash',
      ],
      exclusions: [
        'Cleaning interior of occupied bedroom wardrobes/drawers',
        'Removal of wet cement or post-renovation debris',
        'Chandelier and antique restoration',
      ],
      cancellationPolicy:
          'Free cancellation up to 3 hours prior to technician arrival.',
    ),
    ServiceItem(
      id: 'srv_2',
      title: 'Inverter AC Precision Tune-Up',
      categoryId: 'cat_ac_hvac',
      categoryName: 'AC & HVAC',
      rating: 4.8,
      reviewCount: 198,
      durationMinutes: 60,
      basePrice: 59,
      badgeType: ServiceBadgeType.topRated,
      description:
          'High-pressure jet wash of cooling coils, blower fan cleaning, gas pressure inspection, and air filter sterilization.',
      icon: Icons.ac_unit_rounded,
      providerName: 'Marcus Vance (HVAC Master)',
      providerExperience: '7+ years experience • Certified Specialist',
      isVerified: true,
      imageAssetPath: 'assets/images/screen.png',
      inclusions: [
        'High-pressure water jet cleaning of indoor cooling coils',
        'Outdoor unit fin cleaning and debris clearing',
        'Drain pipe flushing and blockage removal',
        'Refrigerant gas pressure and amperage diagnostic',
        '30-day cooling assurance warranty',
      ],
      exclusions: [
        'Refrigerant gas top-up or full refill (quoted separately if required)',
        'PCB board replacement or compressor repair',
      ],
      cancellationPolicy:
          'Free cancellation up to 2 hours before scheduled slot.',
    ),
    ServiceItem(
      id: 'srv_3',
      title: 'Smart Switchboard & Wiring Check',
      categoryId: 'cat_electrical',
      categoryName: 'Electrical',
      rating: 4.9,
      reviewCount: 115,
      durationMinutes: 45,
      basePrice: 45,
      badgeType: ServiceBadgeType.verified,
      description:
          'Safety audit of household circuit breakers, earthing resistance testing, loose wire tightening, and smart device compatibility check.',
      icon: Icons.bolt_rounded,
      providerName: 'David Chen (Licensed Electrician)',
      providerExperience: '6+ years experience • State Licensed',
      isVerified: true,
      inclusions: [
        'Comprehensive load testing on main distribution board',
        'Tightening of loose terminals across switchboards',
        'Earth leakage and neutral voltage check',
        'Safety report with recommended repairs or upgrades',
      ],
      exclusions: [
        'Concealed conduit wall cutting or re-wiring',
        'Cost of replacement MCBs or premium smart switches',
      ],
      cancellationPolicy:
          'Free cancellation up to 2 hours before scheduled slot.',
    ),
    ServiceItem(
      id: 'srv_4',
      title: 'Faucet Leak & Pipe Line Overhaul',
      categoryId: 'cat_plumbing',
      categoryName: 'Plumbing',
      rating: 4.7,
      reviewCount: 86,
      durationMinutes: 50,
      basePrice: 49,
      badgeType: ServiceBadgeType.none,
      description:
          'Precision acoustic leak detection, ceramic cartridge replacement, valve seal renewals, and water pressure balancing.',
      icon: Icons.water_drop_rounded,
      providerName: 'Riverstone Plumbing Works',
      providerExperience: '4+ years verified • 480+ completed jobs',
      isVerified: true,
      imageAssetPath: 'assets/images/screen.png',
      inclusions: [
        'Inspection of up to 4 faucets or shower mixing valves',
        'Washer and internal O-ring seal replacements',
        'Angle valve and inlet pipe joint tightening',
        'Water flow and pressure measurement',
      ],
      exclusions: [
        'Underground piping excavation',
        'Replacement of designer ceramic basins or bathtub fixtures',
      ],
      cancellationPolicy:
          'Free cancellation up to 2 hours before scheduled slot.',
    ),
    ServiceItem(
      id: 'srv_5',
      title: 'Dual Door Refrigerator Servicing',
      categoryId: 'cat_appliances',
      categoryName: 'Appliance Care',
      rating: 4.8,
      reviewCount: 142,
      durationMinutes: 75,
      basePrice: 69,
      badgeType: ServiceBadgeType.topRated,
      description:
          'Condenser coil clearing, defrost thermostat inspection, door gasket sealing audit, and cooling performance recalibration.',
      icon: Icons.kitchen_rounded,
      providerName: 'Appliance Masters Hub',
      providerExperience: '8+ years verified • Multi-brand Trained',
      isVerified: true,
      inclusions: [
        'Condenser coil and compressor compartment vacuuming',
        'Drain line defrost pan cleaning and mold treatment',
        'Thermostat temperature sensor accuracy calibration',
        'Magnetic door gasket seal and alignment inspection',
      ],
      exclusions: [
        'Compressor replacement or gas charging',
        'Internal door shelves and drawer plastic replacements',
      ],
      cancellationPolicy:
          'Free cancellation up to 2 hours before scheduled slot.',
    ),
    ServiceItem(
      id: 'srv_6',
      title: 'Kitchen Sanitization & Degreasing',
      categoryId: 'cat_cleaning',
      categoryName: 'Deep Cleaning',
      rating: 4.8,
      reviewCount: 164,
      durationMinutes: 90,
      basePrice: 65,
      badgeType: ServiceBadgeType.verified,
      description:
          'Targeted heavy-duty grease breakdown for gas hobs, exhaust vents, splashback tiles, and sink drainage sanitation.',
      icon: Icons.soup_kitchen_rounded,
      providerName: 'CleanPro Specialist Team',
      providerExperience: '3+ years experience • 650+ jobs',
      isVerified: true,
      inclusions: [
        'Non-abrasive chemical degreasing of stovetops and burners',
        'Exterior chimney hood and baffle filter degreasing',
        'Splashback ceramic tile grout scrubbing',
        'Stainless steel sink descaling and drain deodorizing',
      ],
      exclusions: [
        'Internal chimney motor dismantle and duct repair',
        'Interior oven cavity cleaning (available as add-on)',
      ],
      cancellationPolicy:
          'Free cancellation up to 2 hours before scheduled slot.',
    ),
    ServiceItem(
      id: 'srv_7',
      title: 'Master AC Gas Refill & Leak Fix',
      categoryId: 'cat_ac_hvac',
      categoryName: 'AC & HVAC',
      rating: 4.7,
      reviewCount: 94,
      durationMinutes: 75,
      basePrice: 89,
      badgeType: ServiceBadgeType.none,
      description:
          'Nitrogen pressure leak detection, copper brazing repair, vacuum pump moisture evacuation, and factory-standard refrigerant refill.',
      icon: Icons.hvac_rounded,
      providerName: 'Marcus Vance (HVAC Master)',
      providerExperience: '7+ years experience • Certified Specialist',
      isVerified: true,
      inclusions: [
        'Nitrogen pressure test to locate micro-leaks in copper piping',
        'Precision flare nut and joint sealing',
        'Deep system evacuation using dual-stage vacuum pump',
        'Weighed refrigerant charge up to OEM factory specification',
        '60-day leak recurrence warranty',
      ],
      exclusions: [
        'Replacement of cracked condenser coils',
        'Electrical board or sensor replacements',
      ],
      cancellationPolicy:
          'Free cancellation up to 2 hours before scheduled slot.',
    ),
    ServiceItem(
      id: 'srv_8',
      title: 'Ceiling Fan & LED Fixture Install',
      categoryId: 'cat_electrical',
      categoryName: 'Electrical',
      rating: 4.6,
      reviewCount: 78,
      durationMinutes: 40,
      basePrice: 39,
      badgeType: ServiceBadgeType.none,
      description:
          'Secure ceiling anchor mounting, downrod assembly, balancing blades, and safety hook testing for fans and modern luminaires.',
      icon: Icons.light_rounded,
      providerName: 'David Chen (Licensed Electrician)',
      providerExperience: '6+ years experience • State Licensed',
      isVerified: true,
      inclusions: [
        'Assembly and ceiling mounting of 1 ceiling fan or light fixture',
        'Capacitor and speed regulator connection check',
        'Blade balancing to prevent wobble and vibration noise',
        'Old fixture uninstallation',
      ],
      exclusions: [
        'Running new concealed electrical wires to ceiling hook',
        'Supply of ceiling fan, downrod, or light fixture hardware',
      ],
      cancellationPolicy:
          'Free cancellation up to 2 hours before scheduled slot.',
    ),
    ServiceItem(
      id: 'srv_9',
      title: 'Drain De-Clogging & Hydro Jetting',
      categoryId: 'cat_plumbing',
      categoryName: 'Plumbing',
      rating: 4.8,
      reviewCount: 143,
      durationMinutes: 60,
      basePrice: 55,
      badgeType: ServiceBadgeType.popular,
      description:
          'Mechanical motorized snake and bio-enzyme clean to clear stubborn grease, hair, and soap scum blockages in kitchen and bath drains.',
      icon: Icons.waves_rounded,
      providerName: 'Riverstone Plumbing Works',
      providerExperience: '4+ years verified • 480+ completed jobs',
      isVerified: true,
      inclusions: [
        'Heavy-duty motorized drain auger operation up to 20 feet',
        'P-trap disassembly, debris removal, and washer resealing',
        'Drain flow velocity test and deodorizing rinse',
        '14-day clog recurrence guarantee',
      ],
      exclusions: [
        'Main sewer line municipal junction repairs',
        'Replacement of broken underground clay or PVC drain lines',
      ],
      cancellationPolicy:
          'Free cancellation up to 2 hours before scheduled slot.',
    ),
    ServiceItem(
      id: 'srv_10',
      title: 'Automatic Washing Machine Diagnostic',
      categoryId: 'cat_appliances',
      categoryName: 'Appliance Care',
      rating: 4.7,
      reviewCount: 112,
      durationMinutes: 60,
      basePrice: 59,
      badgeType: ServiceBadgeType.none,
      description:
          'Spin cycle vibration diagnostics, inlet solenoid valve testing, drum bearing check, and drain pump filter clearing.',
      icon: Icons.local_laundry_service_rounded,
      providerName: 'Appliance Masters Hub',
      providerExperience: '8+ years verified • Multi-brand Trained',
      isVerified: true,
      inclusions: [
        'Error code scan and PCB control board diagnostic',
        'Drain filter cleaning and lint trap flush',
        'Motor drive belt tension and pulley inspection',
        'Water intake and pressure switch audit',
      ],
      exclusions: [
        'Cost of replacement drive belts, pumps, or control boards',
        'Full drum bearing replacement work',
      ],
      cancellationPolicy:
          'Free cancellation up to 2 hours before scheduled slot.',
    ),
    ServiceItem(
      id: 'srv_11',
      title: 'Single Accent Wall Designer Paint',
      categoryId: 'cat_painting',
      categoryName: 'Painting',
      rating: 4.8,
      reviewCount: 67,
      durationMinutes: 120,
      basePrice: 85,
      badgeType: ServiceBadgeType.verified,
      description:
          'Surface putty leveling, primer coat, and two coats of premium low-VOC emulsion paint on a single feature wall up to 120 sq ft.',
      icon: Icons.format_paint_rounded,
      providerName: 'Spectrum Finish Masters',
      providerExperience: '9+ years verified • Color Consultation Certified',
      isVerified: true,
      inclusions: [
        'Floor masking with protective plastic drop sheets',
        'Wall sanding and minor crack putty filling',
        '1 base primer coat and 2 coats of premium washable paint',
        'Post-work site cleanup and masking tape removal',
      ],
      exclusions: [
        'Full room four-wall painting',
        'Treating active interior water seepage or severe dampness',
      ],
      cancellationPolicy:
          'Free cancellation up to 3 hours before scheduled slot.',
    ),
  ];

  /// Curated featured services displayed on the home feed (first 5 services)
  static List<ServiceItem> get featuredServices => allServices.take(5).toList();

  /// Retrieve a service by its unique stable ID
  static ServiceItem? getServiceById(String id) {
    try {
      return allServices.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Filter and sort services for the Explore screen
  static List<ServiceItem> filterServices({
    String? query,
    String? categoryId,
    double? maxPrice,
    ServiceSortOption sortOption = ServiceSortOption.recommended,
  }) {
    var result = List<ServiceItem>.from(allServices);

    // Category filter
    if (categoryId != null && categoryId.isNotEmpty && categoryId != 'all') {
      result = result.where((s) => s.categoryId == categoryId).toList();
    }

    // Search query filter (matches title, description, or category name)
    if (query != null && query.trim().isNotEmpty) {
      final cleanQuery = query.trim().toLowerCase();
      result = result.where((s) {
        final titleMatch = s.title.toLowerCase().contains(cleanQuery);
        final descMatch = s.description.toLowerCase().contains(cleanQuery);
        final catMatch = s.categoryName.toLowerCase().contains(cleanQuery);
        return titleMatch || descMatch || catMatch;
      }).toList();
    }

    // Price filter
    if (maxPrice != null && maxPrice > 0) {
      result = result.where((s) => s.basePrice <= maxPrice).toList();
    }

    // Sort order
    switch (sortOption) {
      case ServiceSortOption.recommended:
        // Keep catalog order (featured/popular weighted)
        break;
      case ServiceSortOption.ratingHighToLow:
        result.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case ServiceSortOption.priceLowToHigh:
        result.sort((a, b) => a.basePrice.compareTo(b.basePrice));
        break;
      case ServiceSortOption.priceHighToLow:
        result.sort((a, b) => b.basePrice.compareTo(a.basePrice));
        break;
      case ServiceSortOption.durationShortest:
        result.sort((a, b) => a.durationMinutes.compareTo(b.durationMinutes));
        break;
    }

    return result;
  }

  /// Active upcoming booking instance displayed on the Home screen.
  static const BookingRecord activeUpcomingBookingRecord = BookingRecord(
    id: 'bk_101',
    serviceId: 'srv_1',
    serviceTitle: 'Standard Home Refresh',
    categoryName: 'Deep Cleaning',
    providerName: 'Elena R.',
    providerRating: 5.0,
    scheduledDateFormatted: 'Tomorrow, Oct 24',
    scheduledTimeFormatted: '10:00 AM – 12:30 PM',
    status: 'Confirmed',
    locationAddress: '742 Evergreen Terrace, Apt 4B',
    locationNote: 'FRONT DOOR CODE #4812 • APT 4B',
    price: 95.0,
    isPast: false,
  );

  /// Active upcoming booking for legacy UpcomingBooking consumers
  static UpcomingBooking get activeUpcomingBooking =>
      activeUpcomingBookingRecord.toUpcomingBooking();

  /// Sample upcoming booking instance available for future verification or preview.
  static const UpcomingBooking sampleUpcomingBooking = UpcomingBooking(
    id: 'bk_1092',
    serviceTitle: 'Inverter AC Precision Tune-Up',
    providerName: 'Marcus Vance (Certified Tech)',
    scheduledTimeFormatted: 'Tomorrow at 10:30 AM',
    status: 'Confirmed',
    locationAddress: 'Flat 402, Oakwood Residences',
  );

  /// Stitch-aligned sample upcoming bookings (when active)
  static const List<BookingRecord> sampleUpcomingBookings = [
    BookingRecord(
      id: 'bk_101',
      serviceId: 'srv_1',
      serviceTitle: 'Standard Home Refresh',
      categoryName: 'Deep Cleaning',
      providerName: 'Elena R.',
      providerRating: 5.0,
      scheduledDateFormatted: 'Tomorrow, Oct 24',
      scheduledTimeFormatted: '10:00 AM – 12:30 PM',
      status: 'Confirmed',
      locationAddress: '742 Evergreen Terrace, Apt 4B',
      locationNote: 'FRONT DOOR CODE #4812 • APT 4B',
      price: 95.0,
      isPast: false,
    ),
  ];

  /// Stitch-aligned sample past booking history (matching 'Past 3' count)
  static const List<BookingRecord> samplePastBookings = [
    BookingRecord(
      id: 'bk_201',
      serviceId: 'srv_2',
      serviceTitle: 'AC Seasonal Tune-Up',
      categoryName: 'AC & HVAC',
      providerName: 'Marcus Vance',
      providerRating: 4.9,
      scheduledDateFormatted: 'Oct 12, 2026',
      scheduledTimeFormatted: '2:00 PM – 3:30 PM',
      status: 'Completed',
      locationAddress: '742 Evergreen Terrace, Apt 4B',
      price: 89.0,
      isPast: true,
    ),
    BookingRecord(
      id: 'bk_202',
      serviceId: 'srv_4',
      serviceTitle: 'Drain & Faucet Repair',
      categoryName: 'Plumbing',
      providerName: 'David Chen',
      providerRating: 4.8,
      scheduledDateFormatted: 'Sep 28, 2026',
      scheduledTimeFormatted: '11:00 AM – 12:00 PM',
      status: 'Completed',
      locationAddress: '742 Evergreen Terrace, Apt 4B',
      price: 75.0,
      isPast: true,
    ),
    BookingRecord(
      id: 'bk_203',
      serviceId: 'srv_1',
      serviceTitle: 'Whole Home Deep Clean',
      categoryName: 'Deep Cleaning',
      providerName: 'Apex Clean Pro Crew',
      providerRating: 5.0,
      scheduledDateFormatted: 'Aug 15, 2026',
      scheduledTimeFormatted: '9:00 AM – 1:00 PM',
      status: 'Completed',
      locationAddress: '1200 Market St, Suite 300',
      price: 120.0,
      isPast: true,
    ),
  ];

  /// Stitch-aligned sample customer profile with saved addresses
  static const UserProfile sampleUserProfile = UserProfile(
    id: 'usr_alex',
    name: 'Alex Morgan',
    initials: 'AM',
    email: 'alex.morgan@example.com',
    phone: '+1 (555) 019-2834',
    savedAddresses: [
      SavedAddress(
        id: 'addr_1',
        label: 'Home',
        addressLine: '742 Evergreen Terrace, Apt 4B, Springfield',
        detailsNote: 'FRONT DOOR CODE #4812 • APT 4B',
        isDefault: true,
        icon: Icons.home_rounded,
      ),
      SavedAddress(
        id: 'addr_2',
        label: 'Studio Workspace',
        addressLine: '1200 Market St, Suite 300, Downtown',
        detailsNote: 'BUILDING BUZZER #300',
        isDefault: false,
        icon: Icons.business_rounded,
      ),
    ],
  );
}
