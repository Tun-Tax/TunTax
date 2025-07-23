import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Center(
        child: Text('Account Screen'),
      ),
    );
  }
}