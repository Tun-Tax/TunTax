import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuntax/widgets/scaffold_with_nav_bar.dart';
import 'package:tuntax/state/auth_state.dart';
import 'package:tuntax/utils/app_preferences.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final isFirstTimeUserFuture = AppPreferences.getIsFirstTimeUser();

  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) async {
          final isFirstTimeUser = await isFirstTimeUserFuture;
          if (isFirstTimeUser) {
            return '/landing';
          } else {
            switch (authState) {
              case AuthState.authenticated:
                return '/home';
              case AuthState.unauthenticated:
                return '/login';
              case AuthState.initial:
              return '/login';
            }
          }
        },
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const SizedBox.shrink()), // Placeholder
      ),
      GoRoute(
        path: '/landing',
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
    redirect: (context, state) async {
      final isFirstTimeUser = await isFirstTimeUserFuture;
      final isAuthenticated = authState == AuthState.authenticated;
      final isUnauthenticated = authState == AuthState.unauthenticated;

      final goingToLogin = state.matchedLocation == '/login';
      final goingToSignup = state.matchedLocation == '/signup';
      final goingToLanding = state.matchedLocation == '/landing';

      // If not first time user and not authenticated, redirect to login
      if (!isFirstTimeUser && !isAuthenticated && !goingToLogin && !goingToSignup) {
        return '/login';
      }
      // If authenticated and trying to go to login/signup/landing, redirect to home
      if (isAuthenticated && (goingToLogin || goingToSignup || goingToLanding)) {
        return '/home';
      }
      // If first time user and not going to landing, redirect to landing
      if (isFirstTimeUser && !goingToLanding) {
        return '/landing';
      }
      // No redirect needed
      return null;
    },
  );
});
