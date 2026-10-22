import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slotly/app/router/app_router.dart';
import 'package:slotly/app/slotly_app.dart';

void main() {
  setUp(() {
    // Reset GoRouter to initial route before each test
    AppRouter.router.go('/home');
  });

  testWidgets('Top-level navigation switches between primary tabs', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const SlotlyApp());
    await tester.pumpAndSettle();

    // Verify Home screen loaded
    expect(find.text('Slotly'), findsOneWidget);
    expect(
      find.text('Book trusted services\non your schedule'),
      findsOneWidget,
    );

    // Navigate to Explore tab
    await tester.tap(find.text('Explore'));
    await tester.pumpAndSettle();

    // Verify Explore screen loaded
    expect(find.text('Explore Services'), findsOneWidget);
    expect(
      find.text('Search service name, keywords, tasks...'),
      findsOneWidget,
    );

    // Navigate to Bookings tab
    await tester.tap(find.text('Bookings'));
    await tester.pumpAndSettle();

    // Verify Bookings screen loaded
    expect(find.text('No Bookings Yet'), findsOneWidget);

    // Navigate to Profile tab
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();

    // Verify Profile screen loaded
    expect(find.text('Guest User'), findsOneWidget);

    // Return to Home tab
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Slotly'), findsOneWidget);
  });

  testWidgets(
    'Explore screen filters services by search query and shows results',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const SlotlyApp());
      await tester.pumpAndSettle();

      // Go to Explore tab
      await tester.tap(find.text('Explore'));
      await tester.pumpAndSettle();

      // Enter search keyword
      final searchField = find.widgetWithText(
        TextField,
        'Search service name, keywords, tasks...',
      );
      expect(searchField, findsOneWidget);

      await tester.enterText(searchField, 'refrigerator');
      await tester.pumpAndSettle();

      // Should find the refrigerator service
      expect(find.text('Dual Door Refrigerator Servicing'), findsOneWidget);
      // Should NOT find unrelated services like deep cleaning
      expect(find.text('Full Home Deep Cleaning'), findsNothing);

      // Active filter chip should appear
      expect(find.text('Query: "refrigerator"'), findsOneWidget);
    },
  );

  testWidgets('Explore screen filters services by category chip', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const SlotlyApp());
    await tester.pumpAndSettle();

    // Go to Explore
    await tester.tap(find.text('Explore'));
    await tester.pumpAndSettle();

    // Tap on 'AC & HVAC' category chip
    await tester.tap(find.widgetWithText(ChoiceChip, 'AC & HVAC'));
    await tester.pumpAndSettle();

    // Verify AC services are displayed
    expect(find.text('Inverter AC Precision Tune-Up'), findsOneWidget);
    // Verify non-AC services are excluded
    expect(find.text('Full Home Deep Cleaning'), findsNothing);
  });

  testWidgets(
    'Explore screen shows intentional empty state when no services match',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const SlotlyApp());
      await tester.pumpAndSettle();

      // Go to Explore
      await tester.tap(find.text('Explore'));
      await tester.pumpAndSettle();

      // Enter non-matching query
      final searchField = find.widgetWithText(
        TextField,
        'Search service name, keywords, tasks...',
      );
      await tester.enterText(searchField, 'NonExistentXYZServiceName');
      await tester.pumpAndSettle();

      // Empty state should be visible
      expect(find.text('No services match your criteria'), findsOneWidget);
      expect(find.text('Reset All Filters'), findsOneWidget);

      // Reset filters
      await tester.tap(find.text('Reset All Filters'));
      await tester.pumpAndSettle();

      // Full catalog returns
      expect(find.text('Full Home Deep Cleaning'), findsOneWidget);
    },
  );

  testWidgets(
    'Opening service details displays inclusions, exclusions, and booking CTA',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const SlotlyApp());
      await tester.pumpAndSettle();

      // Go to Explore
      await tester.tap(find.text('Explore'));
      await tester.pumpAndSettle();

      // Tap on the first service card
      await tester.tap(find.text('Full Home Deep Cleaning'));
      await tester.pumpAndSettle();

      // Verify ServiceDetailScreen is displayed
      expect(find.text("What's Included"), findsOneWidget);
      expect(find.text("What's Not Included"), findsOneWidget);
      expect(find.text('Apex Clean Pro Crew'), findsOneWidget);
      expect(find.text('Select Time Slot'), findsOneWidget);

      // Tap booking CTA to verify Day 3 milestone preview bottom sheet
      await tester.tap(find.text('Select Time Slot'));
      await tester.pumpAndSettle();

      expect(find.text('Slot Booking Preview'), findsOneWidget);
      expect(find.text('Scheduled for Day 3 Milestone'), findsOneWidget);

      // Dismiss bottom sheet
      await tester.tap(find.text('Understood • Return to Service'));
      await tester.pumpAndSettle();

      // Navigate back to Explore
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();

      expect(find.text('Explore Services'), findsOneWidget);
    },
  );

  testWidgets(
    'Navigating to an unknown service ID renders graceful fallback screen',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const SlotlyApp());
      await tester.pumpAndSettle();

      // Deep-link to unknown service route
      AppRouter.router.push('/services/invalid_service_999');
      await tester.pumpAndSettle();

      // Verify graceful fallback view
      expect(find.text('Service Not Found'), findsOneWidget);
      expect(find.text('Browse All Services'), findsOneWidget);

      // Tap Browse All Services button
      await tester.tap(find.text('Browse All Services'));
      await tester.pumpAndSettle();

      expect(find.text('Explore Services'), findsOneWidget);
    },
  );

  testWidgets(
    'Bookings screen allows toggling between upcoming and past tabs',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const SlotlyApp());
      await tester.pumpAndSettle();

      // Go to Bookings
      await tester.tap(find.text('Bookings'));
      await tester.pumpAndSettle();

      // Verify segmented tabs
      expect(find.text('Upcoming (0)'), findsOneWidget);
      expect(find.text('Past History (0)'), findsOneWidget);
      expect(find.text('No Bookings Yet'), findsOneWidget);

      // Toggle to Past History tab
      await tester.tap(find.text('Past History (0)'));
      await tester.pumpAndSettle();

      expect(
        find.text(
          'You do not have any past completed services on this device yet.',
        ),
        findsOneWidget,
      );

      // Tap Browse Services CTA
      await tester.tap(find.text('Browse Services'));
      await tester.pumpAndSettle();

      expect(find.text('Explore Services'), findsOneWidget);
    },
  );

  testWidgets('Profile screen displays user details and settings groups', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const SlotlyApp());
    await tester.pumpAndSettle();

    // Go to Profile
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();

    // Verify Identity
    expect(find.text('Guest User'), findsOneWidget);
    expect(find.text('Saved Addresses'), findsOneWidget);
    expect(find.text('Payment Methods'), findsOneWidget);
    expect(find.text('Help Center & FAQs'), findsOneWidget);

    // Tap an item to test feedback
    await tester.tap(find.text('Saved Addresses'));
    await tester.pump();

    expect(
      find.text('Address book management connects with customer accounts.'),
      findsOneWidget,
    );
  });
}
