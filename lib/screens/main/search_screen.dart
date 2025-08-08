import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';
import 'package:tuntax/widgets/custom_app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text('Search Screen'),
        ),
      ),
    );
  }
}