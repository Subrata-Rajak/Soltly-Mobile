import 'package:flutter/material.dart';

/// Represents a top-level service category.
class ServiceCategory {
  final String id;
  final String name;
  final IconData icon;
  final int serviceCount;

  const ServiceCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.serviceCount,
  });
}

/// Service badge type for service cards and highlights.
enum ServiceBadgeType { popular, topRated, verified, none }

/// Sorting options for service discovery catalog.
enum ServiceSortOption {
  recommended('Recommended'),
  ratingHighToLow('Rating: High to Low'),
  priceLowToHigh('Price: Low to High'),
  priceHighToLow('Price: High to Low'),
  durationShortest('Duration: Shortest');

  final String label;
  const ServiceSortOption(this.label);
}

/// Represents an individual bookable service item with full discovery & detail attributes.
class ServiceItem {
  final String id;
  final String title;
  final String categoryId;
  final String categoryName;
  final double rating;
  final int reviewCount;
  final int durationMinutes;
  final double basePrice;
  final String currencySymbol;
  final ServiceBadgeType badgeType;
  final String description;
  final IconData icon;
  final List<String> inclusions;
  final List<String> exclusions;
  final String providerName;
  final String providerExperience;
  final bool isVerified;
  final String cancellationPolicy;

  final String? imageAssetPath;

  const ServiceItem({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.categoryName,
    required this.rating,
    required this.reviewCount,
    required this.durationMinutes,
    required this.basePrice,
    this.currencySymbol = '\$',
    this.badgeType = ServiceBadgeType.none,
    required this.description,
    required this.icon,
    this.inclusions = const [],
    this.exclusions = const [],
    this.providerName = 'Certified Slotly Specialist',
    this.providerExperience = '3+ years experience',
    this.isVerified = true,
    this.cancellationPolicy =
        'Free cancellation up to 2 hours before scheduled slot.',
    this.imageAssetPath,
  });

  String get formattedPrice => '$currencySymbol${basePrice.toStringAsFixed(0)}';
  String get formattedDuration => '$durationMinutes min';
}

/// Represents an upcoming or recent appointment booking.
class UpcomingBooking {
  final String id;
  final String serviceTitle;
  final String providerName;
  final String scheduledTimeFormatted;
  final String status;
  final String locationAddress;

  const UpcomingBooking({
    required this.id,
    required this.serviceTitle,
    required this.providerName,
    required this.scheduledTimeFormatted,
    required this.status,
    required this.locationAddress,
  });
}

/// Structured booking record supporting both Upcoming visits and Past history presentations.
class BookingRecord {
  final String id;
  final String serviceId;
  final String serviceTitle;
  final String categoryName;
  final String providerName;
  final double providerRating;
  final String scheduledDateFormatted;
  final String scheduledTimeFormatted;
  final String status;
  final String locationAddress;
  final String? locationNote;
  final double price;
  final bool isPast;

  const BookingRecord({
    required this.id,
    required this.serviceId,
    required this.serviceTitle,
    required this.categoryName,
    required this.providerName,
    this.providerRating = 5.0,
    required this.scheduledDateFormatted,
    required this.scheduledTimeFormatted,
    required this.status,
    required this.locationAddress,
    this.locationNote,
    required this.price,
    this.isPast = false,
  });

  /// Compatibility adapter for existing UpcomingBooking consumers
  UpcomingBooking toUpcomingBooking() {
    return UpcomingBooking(
      id: id,
      serviceTitle: serviceTitle,
      providerName: providerName,
      scheduledTimeFormatted:
          '$scheduledDateFormatted, $scheduledTimeFormatted',
      status: status,
      locationAddress: locationAddress,
    );
  }
}

/// Represents a customer saved location/address for home services.
class SavedAddress {
  final String id;
  final String label;
  final String addressLine;
  final String? detailsNote;
  final bool isDefault;
  final IconData icon;

  const SavedAddress({
    required this.id,
    required this.label,
    required this.addressLine,
    this.detailsNote,
    this.isDefault = false,
    this.icon = Icons.home_rounded,
  });
}

/// Customer profile data representation.
class UserProfile {
  final String id;
  final String name;
  final String initials;
  final String email;
  final String phone;
  final List<SavedAddress> savedAddresses;

  const UserProfile({
    required this.id,
    required this.name,
    required this.initials,
    required this.email,
    required this.phone,
    this.savedAddresses = const [],
  });
}
