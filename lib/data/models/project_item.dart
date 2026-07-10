class ProjectItem {
  const ProjectItem({
    required this.kicker,
    required this.title,
    required this.description,
    required this.outcome,
    required this.imagePath,
    required this.stack,
    this.url,
  });

  final String kicker;
  final String title;
  final String description;
  final String outcome;
  final String imagePath;
  final List<String> stack;
  final String? url;
}
