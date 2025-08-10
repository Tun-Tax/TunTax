import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuntax/state/auth_state.dart';
import 'package:tuntax/widgets/account/account_management_card.dart';
import 'package:tuntax/widgets/background_alt.dart';
import 'package:tuntax/widgets/account/user_profile_card.dart';
import 'package:tuntax/widgets/custom_app_bar.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return BackgroundAlt(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(showActions: false),
        body: Column(
          children: [
            userAsyncValue.when(
              data: (user) {
                if (user != null) {
                  return UserProfileCard(user: user);
                } else {
                  // This part should ideally not be reached if the router redirects correctly
                  return const Center(child: Text('Not logged in'));
                }
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
            const SizedBox(height: 32),
            const AccountManagementCard(),
            const SizedBox(height: 24),
            // ElevatedButton(
            //   onPressed: () async {
            //     await ref.read(authServiceProvider).signOut();
            //     if (context.mounted) {
            //       context.go('/login');
            //     }
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.red,
            //     foregroundColor: Colors.white,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     minimumSize: const Size(double.infinity, 50),
            //   ),
            //   child: const Text('Log Out'),
            // ),
          ],
        ),
      ),
    );
  }
}

