import 'package:flutter/material.dart';
import 'package:tuntax/models/academy_content.dart';
import 'package:tuntax/widgets/background.dart';
import 'package:tuntax/widgets/academy/academy_detail_module_item.dart';
import 'package:tuntax/screens/academy/article_content_screen.dart';
import 'package:tuntax/screens/academy/video_content_screen.dart';

class AcademyDetailScreen extends StatefulWidget {
  final AcademyContent content;

  const AcademyDetailScreen({super.key, required this.content});

  @override
  State<AcademyDetailScreen> createState() => _AcademyDetailScreenState();
}

class _AcademyDetailScreenState extends State<AcademyDetailScreen> {
  bool _isStarted = false; // Dummy state to check if module is started
  int _lastViewedIndex =
      -1; // Track the index of the last viewed sub-content (-1 means not started)

  // Dummy data for sub-modules/articles/videos within a main module/article
  final List<AcademyContent> subContents = [
    AcademyContent(
      title: 'Poriwisata Makanan',
      description: 'Mengenal ikan tambak bersama Kak Jelly dan Kak Astuti',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'video',
    ),
    AcademyContent(
      title: 'Poriwisata Makanan',
      description: 'Mengenal ikan tambak bersama Kak Jelly dan Kak Astuti',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'article',
    ),
    AcademyContent(
      title: 'Poriwisata Makanan',
      description: 'Mengenal ikan tambak bersama Kak Jelly dan Kak Astuti',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'article',
    ),
    AcademyContent(
      title: 'Poriwisata Makanan',
      description: 'Mengenal ikan tambak bersama Kak Jelly dan Kak Astuti',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'video',
    ),
    AcademyContent(
      title: 'Poriwisata Makanan',
      description: 'Mengenal ikan tambak bersama Kak Jelly dan Kak Astuti',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'video',
    ),
    AcademyContent(
      title: 'Poriwisata Makanan',
      description: 'Mengenal ikan tambak bersama Kak Jelly dan Kak Astuti',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'video',
    ),
    AcademyContent(
      title: 'Poriwisata Makanan',
      description: 'Mengenal ikan tambak bersama Kak Jelly dan Kak Astuti',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'video',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final content = widget.content;

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
          elevation: 4,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                content.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                content.description,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(204, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.deepPurple, // Deep purple background
                            foregroundColor: Colors.white, // White text color
                          ),
                          onPressed: () {
                            setState(() {
                              _isStarted = true;
                              _lastViewedIndex =
                                  0; // Start from the first sub-content
                            });
                            // Navigate to the content screen based on type
                            if (content.type == 'article') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ArticleContentScreen(content: content),
                                ),
                              );
                            } else if (content.type == 'video') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VideoContentScreen(content: content),
                                ),
                              );
                            }
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.play_arrow), // Play icon
                              const SizedBox(width: 8),
                              Text(_isStarted ? 'Lanjutkan' : 'Mulai'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Display sub-contents with chaining boxes
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: subContents.length,
                      itemBuilder: (context, index) {
                        final subContent = subContents[index];
                        final isCompleted =
                            index <=
                            _lastViewedIndex; // Completion logic based on last viewed index
                        final hasNext = index < subContents.length - 1;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: AcademyDetailModuleItem(
                            content: subContent,
                            isCompleted: isCompleted,
                            hasNext: hasNext,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_lastViewedIndex < subContents.length - 1) {
                              _lastViewedIndex++;
                            } else {
                              // Optionally, navigate back or show completion message
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Text(
                          _lastViewedIndex < subContents.length - 1
                              ? 'Selanjutnya'
                              : 'Selesai',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
