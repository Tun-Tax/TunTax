import 'package:flutter/material.dart';
import 'package:tuntax/widgets/account/custom_outlined_button.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFFE0D6FF),
            child: Text(
              'A',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF4A00E0),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Angela Ibis',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'tuntaxixi@gmail.com',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'bergabung 20 Agustus 2021',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              CustomOutlinedButton(
                onPressed: () {},
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
