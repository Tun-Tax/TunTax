import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HSLColor.fromColor(const Color(0xFF4983F6)).withLightness(0.95).toColor(),
              HSLColor.fromColor(const Color(0xFFC175F5)).withLightness(0.95).toColor(),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: _navBarItems(),
          currentIndex: currentIndex,
          onTap: onTap,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _navBarItems() {
    final List<Map<String, dynamic>> items = [
      {'iconPath': 'assets/svgs/home.svg', 'label': 'Home', 'isSvg': true},
      {
        'iconPath': 'assets/svgs/file_text.svg',
        'label': 'Transactions',
        'isSvg': true
      },
      {
        'iconPath': 'assets/images/navbar-logo.png',
        'label': 'Chat',
        'isSvg': false
      },
      {
        'iconPath': 'assets/svgs/search_person.svg',
        'label': 'Search',
        'isSvg': true
      },
      {
        'iconPath': 'assets/svgs/person.svg',
        'label': 'Account',
        'isSvg': true
      },
    ];

    return items.map((item) {
      final iconWidget = item['isSvg']
          ? SvgPicture.asset(
              item['iconPath'],
              width: 24, // Fixed width for SVG icons
              height: 24, // Fixed height for SVG icons
            )
          : Image.asset(
              item['iconPath'],
              width: 24, // Fixed width for image icons
              height: 24, // Fixed height for image icons
            );
      return BottomNavigationBarItem(
        icon: iconWidget,
        activeIcon: Container(
          width: 40, // Fixed width for active icon container
          height: 40, // Fixed height for active icon container
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(child: iconWidget), // Center the icon within the container
        ),
        label: item['label'],
      );
    }).toList();
  }
}
