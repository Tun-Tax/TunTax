import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
