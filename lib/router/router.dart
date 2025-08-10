import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tuntax/screens/landing_screen.dart';
import 'package:tuntax/screens/login_screen.dart';
import 'package:tuntax/screens/main/academy_screen.dart';
import 'package:tuntax/screens/main/account_screen.dart';
import 'package:tuntax/screens/main/chat_screen.dart';
import 'package:tuntax/screens/main/home_screen.dart';
import 'package:tuntax/screens/main/search_screen.dart';
import 'package:tuntax/screens/main/article_screen.dart';
import 'package:tuntax/screens/misc/date_screen.dart';
import 'package:tuntax/screens/misc/notification_screen.dart';
import 'package:tuntax/screens/signup_screen.dart';
import 'package:tuntax/widgets/scaffold_with_nav_bar.dart';

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
          path: '/article',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ArticleScreen()),
        ),
        GoRoute(
          path: '/chat',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ChatScreen()),
        ),
        GoRoute(
          path: '/academy',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AcademyScreen()),
        ),
        GoRoute(
          path: '/search',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SearchScreen()),
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
      path: '/menu',
      builder: (BuildContext context, GoRouterState state) {
        return const AccountScreen();
      },
    ),
  ],
);
