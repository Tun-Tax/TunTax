import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tuntax/screens/landing_screen.dart';
import 'package:tuntax/screens/login_screen.dart';
import 'package:tuntax/screens/main/account_screen.dart';
import 'package:tuntax/screens/main/chat_screen.dart';
import 'package:tuntax/screens/main/home_screen.dart';
import 'package:tuntax/screens/main/search_screen.dart';
import 'package:tuntax/screens/main/transactions_screen.dart';
import 'package:tuntax/screens/signup_screen.dart';
import 'package:tuntax/widgets/scaffold_with_nav_bar.dart';
import 'package:tuntax/widgets/scaffold_with_app_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
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
