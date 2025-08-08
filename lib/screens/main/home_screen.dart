import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';
import 'package:tuntax/widgets/scaffold_with_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: ScaffoldWithAppBar(
        child: Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
