import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background_middle.dart';
import 'package:tuntax/widgets/chat_text_field.dart';
import 'package:tuntax/widgets/prompt_chip.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BackgroundMiddle(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Halo,\nbagaimana kami bisa membantu?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),
                ChatTextField(),
                SizedBox(height: 24),
                PromptChip(text: 'Tata cara pelaporan pajak UMKM'),
                SizedBox(height: 16),
                PromptChip(text: 'Berita terbaru tentang insentif pemerintah'),
                SizedBox(height: 16),
                PromptChip(text: 'Bingung dengan fitur-fitur TunTax'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
