import 'package:flutter/material.dart';
import 'package:tuntax/models/academy_content.dart';
import 'package:tuntax/widgets/background.dart';

class VideoContentScreen extends StatelessWidget {
  final AcademyContent content;

  const VideoContentScreen({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            content.title,
            style: const TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_circle_fill,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  content.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(204, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 20),
                // Dummy video description
                Text(
                  'This is the description for the video "${content.title}".\n\n'
                  'Here you would typically embed a video player. For demonstration, this is just a placeholder.',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(179, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to detail screen
                    },
                    child: const Text('Selesai'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
