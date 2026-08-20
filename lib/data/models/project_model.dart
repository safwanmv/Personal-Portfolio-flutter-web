class ProjectModel {
  final String id;
  final String title;
  final String category;
  final String shortDescription;
  final List<String> keyContributions;
  final List<String> techStack;
  final String screenshotPath;
  final String? githubUrl;
  final String? liveUrl;
  final bool isConfidential;
  final String? confidentialNotice;
  final List<String> detailedHighlights;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.category,
    required this.shortDescription,
    required this.keyContributions,
    required this.techStack,
    required this.screenshotPath,
    this.githubUrl,
    this.liveUrl,
    this.isConfidential = false,
    this.confidentialNotice,
    required this.detailedHighlights,
  });
}
