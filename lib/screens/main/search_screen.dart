import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';
import 'package:tuntax/widgets/scaffold_with_app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: ScaffoldWithAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cari konsultan pajak tepercaya di dekatmu',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black, // Or appropriate text color
                ),
              ),
              SizedBox(height: 16), // Add some space
              Center(
                child: Text('Search Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
