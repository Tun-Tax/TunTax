import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}