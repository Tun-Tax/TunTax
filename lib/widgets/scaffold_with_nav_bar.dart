import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tuntax/widgets/custom_nav_bar.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: CustomNavBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/transactions')) {
      return 1;
    }
    if (location.startsWith('/chat')) {
      return 2;
    }
    if (location.startsWith('/search')) {
      return 3;
    }
    if (location.startsWith('/account')) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/transactions');
        break;
      case 2:
        context.go('/chat');
        break;
      case 3:
        context.go('/search');
        break;
      case 4:
        context.go('/account');
        break;
    }
  }
}
