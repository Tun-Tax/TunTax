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
      case 'Notification':
        context.push('/notification');
        break;
      case 'Menu':
        context.push('/menu');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(onIconPressed: _handleAppBarIconPress),
      body: widget.child,
    );
  }
}
