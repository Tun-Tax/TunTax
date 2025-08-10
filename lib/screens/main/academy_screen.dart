import 'package:flutter/material.dart';
import 'package:tuntax/widgets/background.dart';
import 'package:tuntax/widgets/custom_app_bar.dart';
import 'package:tuntax/models/academy_content.dart';
import 'package:tuntax/screens/academy/academy_detail_screen.dart';
import 'package:tuntax/widgets/academy/progress_card.dart';
import 'package:tuntax/widgets/academy/module_card.dart';

class AcademyScreen extends StatefulWidget {
  const AcademyScreen({super.key});

  @override
  State<AcademyScreen> createState() => _AcademyScreenState();
}

class _AcademyScreenState extends State<AcademyScreen> {
  // Dummy data for demonstration
  final List<AcademyContent> academyItems = [
    AcademyContent(
      title: 'Mengenali Pajak UMKM',
      description: 'Pelajari dasar-dasar pajak untuk UMKM.',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'module',
      modulesCount: 10,
    ),
    AcademyContent(
      title: 'Apa itu PPN?',
      description: 'Memahami Pajak Pertambahan Nilai.',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'module',
      modulesCount: 3,
    ),
    AcademyContent(
      title: 'Cara membayar pajak',
      description: 'Panduan langkah demi langkah untuk pembayaran pajak.',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'module',
      modulesCount: 19,
    ),
    AcademyContent(
      title: 'Tingkatkan waspada pajak',
      description: 'Tips dan trik untuk menghindari masalah pajak.',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'module',
      modulesCount: 19,
    ),
    AcademyContent(
      title: 'Belajar Pajak dari Kupu-Kupu',
      description:
          'Mengapa Mengisi SPT Sama Pentingnya dengan Menyiram Tanaman',
      imageUrl: 'https://via.placeholder.com/150',
      type: 'article',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        extendBodyBehindAppBar:
            false, // Set to false so body starts below app bar
        appBar: const CustomAppBar(),
        backgroundColor:
            Colors.white, // Set a solid background color for the scaffold
        body: SafeArea(
          // Added SafeArea to prevent content from being cut off by system UI
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Removed SizedBox as extendBodyBehindAppBar is now false and app bar takes its own space
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Progress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                // Progress Cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ProgressCard(
                        value: '3006',
                        label: 'menit belajar',
                        icon: Icons.timer,
                      ),
                      ProgressCard(
                        value: '15',
                        label: 'modul selesai',
                        icon: Icons.grid_view,
                      ),
                      ProgressCard(
                        value: '39',
                        label: 'artikel terbaca',
                        icon: Icons.article,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Dilihat Terakhir (Last Viewed)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dilihat Terakhir',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(25),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Modul 3: Keraguan Pelaku',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Apa itu PPN?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // List of Modules
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: academyItems.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AcademyDetailScreen(content: item),
                              ),
                            );
                          },
                          child: ModuleCard(item: item),
                        ),
                      );
                    }).toList(),
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
