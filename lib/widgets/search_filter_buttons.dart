import 'package:flutter/material.dart';

enum SearchFilter { terdekat, ratingTinggi }

class SearchFilterButtons extends StatefulWidget {
  final ValueChanged<SearchFilter> onFilterChanged;

  const SearchFilterButtons({super.key, required this.onFilterChanged});

  @override
  State<SearchFilterButtons> createState() => _SearchFilterButtonsState();
}

class _SearchFilterButtonsState extends State<SearchFilterButtons> {
  SearchFilter _selectedFilter = SearchFilter.terdekat;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSegmentButton(SearchFilter.terdekat, 'Terdekat'),
            _buildSegmentButton(SearchFilter.ratingTinggi, 'Rating Tinggi'),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentButton(SearchFilter filter, String text) {
    final isSelected = _selectedFilter == filter;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = filter;
        });
        widget.onFilterChanged(_selectedFilter);
      },
      child: Container(
        width: (screenWidth / 2 / 2)+20, // Half of screen width, divided by 2 for each button
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0), // Smaller vertical padding
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color.fromARGB(30, 73, 131, 246), Color.fromARGB(55, 194, 117, 245)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
          color: isSelected ? null : Colors.transparent,
          borderRadius: BorderRadius.horizontal(
            left: filter == SearchFilter.terdekat ? const Radius.circular(32.0) : Radius.zero,
            right: filter == SearchFilter.ratingTinggi ? const Radius.circular(32.0) : Radius.zero,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected)
              const Icon(Icons.check, size: 16, color: Colors.black), // Checkmark icon
            if (isSelected)
              const SizedBox(width: 4), // Space between icon and text
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.black : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
