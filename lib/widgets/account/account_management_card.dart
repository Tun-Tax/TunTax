import 'package:flutter/material.dart';

class AccountManagementCard extends StatelessWidget {
  const AccountManagementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _buildListTile(Icons.person_outline, 'Edit Profile'),
          _buildListTile(Icons.lock_outline, 'Change Password'),
          _buildListTile(Icons.notifications_outlined, 'Notifications'),
          _buildListTile(Icons.privacy_tip_outlined, 'Privacy Policy'),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
