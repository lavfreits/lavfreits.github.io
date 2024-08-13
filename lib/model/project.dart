class Project {
  final String title;
  final String shortDescription;
  final String detailedDescription;
  final String imageUrl;
  final List<String> technologies;
  final String repoUrl;
  final bool isWeb;

  Project({
    this.isWeb = false,
    required this.title,
    required this.shortDescription,
    required this.detailedDescription,
    required this.technologies,
    required this.imageUrl,
    required this.repoUrl,
  });

  factory Project.fromJson(Map<String, dynamic> json, String localization) =>
      Project(
        title: json['title'][localization] ?? '',
        shortDescription: json['shortDescription'][localization] ?? '',
        detailedDescription: json['detailedDescription'][localization] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        technologies: List<String>.from(json['technologies'] ?? []),
        repoUrl: json['repoUrl'] ?? '',
        isWeb: json['isWeb'] ?? false,
      );
}

//todo adicionar  projeto macaw store e gif do porrtifólio e do login e do site flutter web
