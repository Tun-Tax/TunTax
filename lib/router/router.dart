import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tuntax/providers/app_state_provider.dart';
import 'package:tuntax/screens/landing_screen.dart';
import 'package:tuntax/screens/login_screen.dart';
import 'package:tuntax/screens/main/account_screen.dart';
import 'package:tuntax/screens/main/chat_screen.dart';
import 'package:tuntax/screens/main/home_screen.dart';
import 'package:tuntax/screens/main/search_screen.dart';
import 'package:tuntax/screens/main/transactions_screen.dart';
import 'package:tuntax/screens/misc/date_screen.dart';
import 'package:tuntax/screens/misc/notification_screen.dart';
import 'package:tuntax/screens/misc/settings_screen.dart';
import 'package:tuntax/screens/signup_screen.dart';
import 'package:tuntax/widgets/scaffold_with_nav_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final appState = ref.watch(appStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    redirect: (context, state) {
      if (appState == AppState.initial) {
        // While the app is initializing, don't redirect.
        // This preserves the native splash screen.
        return null;
      }

      final loggedIn = appState == AppState.authenticated;
      final loggingIn = state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup';

      if (appState == AppState.firstTime) {
        return '/';
      }

      if (!loggedIn) {
        return '/login';
      }

      if (loggingIn) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const LandingScreen()),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const LoginScreen()),
      ),
      GoRoute(
        path: '/signup',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const SignupScreen()),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: '/transactions',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TransactionsScreen()),
          ),
          GoRoute(
            path: '/chat',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ChatScreen()),
          ),
          GoRoute(
            path: '/search',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SearchScreen()),
          ),
          GoRoute(
            path: '/account',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AccountScreen()),
          ),
        ],
      ),
      GoRoute(
        path: '/date',
        builder: (BuildContext context, GoRouterState state) {
          return const DateScreen();
        },
      ),
      GoRoute(
        path: '/notification',
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationScreen();
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (BuildContext context, GoRouterState state) {
          return const SettingsScreen();
        },
      ),
    ],
  );
});
