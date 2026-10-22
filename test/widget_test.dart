import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slotly/app/slotly_app.dart';

void main() {
  testWidgets('Slotly home screen renders essential elements and branding',
      (WidgetTester tester) async {
    // Set a typical mobile screen size for consistent layout testing
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Build SlotlyApp
    await tester.pumpWidget(const SlotlyApp());
    await tester.pumpAndSettle();

    // Verify Slotly branding
    expect(find.text('Slotly'), findsOneWidget);

    // Verify Hero title
    expect(find.text('Book trusted services\non your schedule'), findsOneWidget);

    // Verify Upcoming Booking card intentional empty state
    expect(find.text('Upcoming Booking'), findsOneWidget);
    expect(
      find.text('No upcoming services scheduled for this week.'),
      findsOneWidget,
    );

    // Verify Category section
    expect(find.text('Explore Categories'), findsOneWidget);
    expect(find.text('Deep Cleaning'), findsWidgets);

    // Verify Featured services section
    expect(find.text('Featured Services'), findsOneWidget);
    expect(find.text('Full Home Deep Cleaning'), findsOneWidget);

    // Verify Bottom Navigation Bar destinations
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Bookings'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Test Navigation: tap on Bookings tab
    await tester.tap(find.text('Bookings'));
    await tester.pumpAndSettle();

    expect(find.text('No Bookings Yet'), findsOneWidget);
  });
}
