import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background_middle.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundMiddle(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text('Chat Screen'),
        ),
      ),
    );
  }
}