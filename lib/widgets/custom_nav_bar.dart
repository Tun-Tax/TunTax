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
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svgs/home.svg'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svgs/file_text.svg'),
          label: 'Transactions',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/navbar-logo.png'),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svgs/search_person.svg'),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svgs/person.svg'),
          label: 'Account',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}