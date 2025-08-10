class AcademyContent {
  final String title;
  final String description;
  final String imageUrl;
  final String type; // e.g., 'video', 'article', 'module'
  final int? modulesCount; // Only for 'module' type

  AcademyContent({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.type,
    this.modulesCount,
  });

  // Factory constructor to create an AcademyContent from a JSON map
  factory AcademyContent.fromJson(Map<String, dynamic> json) {
    return AcademyContent(
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
      modulesCount: json['modulesCount'] as int?,
    );
  }

  // Method to convert an AcademyContent object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'type': type,
      'modulesCount': modulesCount,
    };
  }
}
