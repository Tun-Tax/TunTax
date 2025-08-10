import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tuntax/services/auth_service.dart';
import 'package:tuntax/widgets/account/custom_outlined_button.dart';

import 'package:tuntax/state/auth_state.dart'; // Import auth_state.dart

class UserProfileCard extends ConsumerWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);
    final userAsyncValue = ref.watch(userProvider); // Watch the userProvider

    return userAsyncValue.when(
      data: (user) {
        if (user == null) {
          return const SizedBox.shrink(); // Or a placeholder if user is not logged in
        }
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
                  style: const TextStyle(fontSize: 20, color: Color(0xFF4A00E0)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            user.displayName ?? 'No Name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'bergabung $formattedDate',
                          style: const TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4), // Added vertical spacing
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.email ?? 'No Email',
                          style: const TextStyle(color: Colors.black54),
                        ),
                        CustomOutlinedButton(
                          onPressed: () async {
                            await authService.signOut();
                          },
                          text: 'Log Out',
                          icon: Icons.logout,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const CircularProgressIndicator(), // Show a loading indicator
      error: (err, stack) => Text('Error: $err'), // Show an error message
    );
  }
}
