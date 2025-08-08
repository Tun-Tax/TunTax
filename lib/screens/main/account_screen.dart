import 'package:flutter/material.dart';
import 'package:tuntax/widgets/account/account_management_card.dart';
import 'package:tuntax/widgets/background_alt.dart';
import 'package:tuntax/widgets/account/user_profile_card.dart';
import 'package:tuntax/widgets/custom_app_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundAlt(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(showActions: false),
        body: Column(
          children: [
            UserProfileCard(),
            SizedBox(height: 32),
            AccountManagementCard(),
          ],
        ),
      ),
    );
  }
}