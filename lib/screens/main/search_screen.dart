import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';
import 'package:tuntax/widgets/scaffold_with_app_bar.dart';
import 'package:tuntax/widgets/search_filter_buttons.dart';
import 'package:tuntax/widgets/person_card_widget.dart'; // Import the new widget

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  void _onFilterChanged(SearchFilter filter) {
    // Handle filter change if needed in the parent screen
    debugPrint('Selected filter: $filter');
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: ScaffoldWithAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cari konsultan pajak tepercaya di dekatmu',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black, // Or appropriate text color
                ),
              ),
              const SizedBox(height: 16), // Add some space
              SearchFilterButtons(onFilterChanged: _onFilterChanged),
              const SizedBox(height: 16), // Add some space
              // Use the new PersonCardWidget here
              const PersonCardWidget(
                imageUrl: 'assets/images/person/person_1.png',
                name: 'Jihan Dwi Athanaya, S. Kom',
                description: 'lorem ipsum lorem ipsum lorem ipsum',
                location: 'Pondok Indah',
                rating: 4.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
