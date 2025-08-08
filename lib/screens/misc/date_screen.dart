import 'package:flutter/material.dart';

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