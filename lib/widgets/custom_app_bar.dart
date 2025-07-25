import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String)? onIconPressed;

  const CustomAppBar({super.key, this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('assets/images/appbar-logo.png'),
      actions: _appBarActions(),
    );
  }

  List<Widget> _appBarActions() {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.calendar_month_outlined, 'label': 'Date'},
      {'icon': Icons.notifications_none_rounded, 'label': 'Notification'},
      {'icon': Icons.settings, 'label': 'Settings'},
    ];

    return items
        .map(
          (item) => _buildAppBarIcon(
            item['icon'] as IconData,
            item['label'] as String,
          ),
        )
        .toList();
  }

  Widget _buildAppBarIcon(IconData iconData, String label) {
    return IconButton(
      icon: Icon(iconData, size: 24),
      onPressed: () {
        onIconPressed?.call(label);
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
