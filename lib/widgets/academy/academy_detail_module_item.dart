import 'package:flutter/material.dart';
import 'package:tuntax/models/academy_content.dart';

class AcademyDetailModuleItem extends StatelessWidget {
  final AcademyContent content;
  final bool isCompleted;
  final bool hasNext;

  const AcademyDetailModuleItem({
    super.key,
    required this.content,
    this.isCompleted = false,
    this.hasNext = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, size: 24, color: Colors.grey),
              ),
              if (hasNext)
                Expanded(
                  child: Container(
                    width: 2,
                    color: isCompleted ? Colors.blue : Colors.grey,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content.type == 'module' ? 'module' : content.type,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  content.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content.description,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
