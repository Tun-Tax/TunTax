import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Center(
        child: Text('Chat Screen'),
      ),
    );
  }
}