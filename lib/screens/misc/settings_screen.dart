import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background_alt.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundAlt(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Settings Screen'),
        ),
        body: const Center(child: Text('This is the Settings Screen')),
      ),
    );
  }
}