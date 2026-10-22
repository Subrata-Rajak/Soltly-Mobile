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

/// Service badge type for home highlights.
enum ServiceBadgeType {
  popular,
  topRated,
  verified,
  none,
}

/// Represents an individual bookable service item.
class ServiceItem {
  final String id;
  final String title;
  final String categoryName;
  final double rating;
  final int reviewCount;
  final int durationMinutes;
  final double basePrice;
  final String currencySymbol;
  final ServiceBadgeType badgeType;
  final String description;
  final IconData icon;

  const ServiceItem({
    required this.id,
    required this.title,
    required this.categoryName,
    required this.rating,
    required this.reviewCount,
    required this.durationMinutes,
    required this.basePrice,
    this.currencySymbol = '\$',
    this.badgeType = ServiceBadgeType.none,
    required this.description,
    required this.icon,
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
