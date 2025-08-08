import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';

class DateScreen extends StatelessWidget {
  const DateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Date Screen'),
        ),
        body: const Center(child: Text('This is the Date Screen')),
      ),
    );
  }
}