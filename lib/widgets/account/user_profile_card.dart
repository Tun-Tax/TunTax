import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tuntax/models/user_model.dart';
import 'package:tuntax/services/auth_service.dart';
import 'package:tuntax/widgets/account/custom_outlined_button.dart';

class UserProfileCard extends ConsumerWidget {
  final UserModel user;
  const UserProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);
    final formattedDate = user.createdAt != null
        ? DateFormat('d MMMM yyyy', 'id_ID').format(user.createdAt!)
        : 'N/A';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFFE0D6FF),
            child: Text(
              user.displayName?.substring(0, 1).toUpperCase() ?? 'A',
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF4A00E0),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.displayName ?? 'No Name',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.email ?? 'No Email',
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'bergabung $formattedDate',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              CustomOutlinedButton(
                onPressed: () async {
                  await authService.signOut();
                },
                text: 'Log Out',
                icon: Icons.logout,
              ),
            ],
          )
        ],
      ),
    );
  }
}
