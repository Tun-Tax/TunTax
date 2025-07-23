import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Center(
        child: Text('Transactions Screen'),
      ),
    );
  }
}
