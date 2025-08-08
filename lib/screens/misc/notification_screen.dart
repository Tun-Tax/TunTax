import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background_alt.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundAlt(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Notification Screen'),
        ),
        body: const Center(child: Text('This is the Notification Screen')),
      ),
    );
  }
}