import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_app_bar.dart';

class ScaffoldWithAppBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithAppBar({super.key, required this.child});

  @override
  State<ScaffoldWithAppBar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScaffoldWithAppBar> {
  void _handleAppBarIconPress(String label) {
    switch (label) {
      case 'Date':
        context.push('/date');
        break;
      case 'Notification':
        context.push('/notification');
        break;
      case 'Settings':
        context.push('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onIconPressed: _handleAppBarIconPress),
      body: widget.child,
    );
  }
}

class DateScreen extends StatelessWidget {
  const DateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date Screen')),
      body: const Center(child: Text('This is the Date Screen')),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Screen')),
      body: const Center(child: Text('This is the Notification Screen')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Screen')),
      body: const Center(child: Text('This is the Settings Screen')),
    );
  }
}
