import 'package:flutter/material.dart';
import 'package:tuntax/widgets/account/account_management_card.dart';
import 'package:tuntax/widgets/background_alt.dart';
import 'package:tuntax/widgets/account/user_profile_card.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundAlt(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 64),
            UserProfileCard(),
            SizedBox(height: 32),
            AccountManagementCard(),
          ],
        ),
      ),
    );
  }
}