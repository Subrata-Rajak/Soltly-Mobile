import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/bookings/presentation/bookings_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/services/presentation/explore_screen.dart';
import '../../features/services/presentation/service_detail_screen.dart';
import 'main_shell.dart';

/// Central GoRouter configuration for Slotly.
/// Employs StatefulShellRoute.indexedStack to preserve tab states and scroll positions.
abstract final class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    debugLogDiagnostics: false,
    routes: [
      // Top-level Stateful Navigation Shell
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),

          // Branch 1: Explore & Catalogue
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/explore',
                name: 'explore',
                builder: (context, state) {
                  final category = state.uri.queryParameters['category'];
                  final query = state.uri.queryParameters['q'];
                  return ExploreScreen(
                    initialCategoryId: category,
                    initialQuery: query,
                  );
                },
              ),
            ],
          ),

          // Branch 2: Bookings
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/bookings',
                name: 'bookings',
                builder: (context, state) =>
                    BookingsScreen(onScheduleTap: () => context.go('/explore')),
              ),
            ],
          ),

          // Branch 3: Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // Full-screen Service Detail Route
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/services/:id',
        name: 'service-detail',
        builder: (context, state) {
          final serviceId = state.pathParameters['id'] ?? '';
          return ServiceDetailScreen(serviceId: serviceId);
        },
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Route not found: ${state.uri}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go('/home'),
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
