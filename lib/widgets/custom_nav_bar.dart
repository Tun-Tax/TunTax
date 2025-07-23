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
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _navBarItems(),
        currentIndex: currentIndex,
        onTap: onTap,
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
      final icon = item['isSvg']
          ? SvgPicture.asset(item['iconPath'])
          : Image.asset(item['iconPath']);
      return BottomNavigationBarItem(
        icon: icon,
        activeIcon: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
        label: item['label'],
      );
    }).toList();
  }
}