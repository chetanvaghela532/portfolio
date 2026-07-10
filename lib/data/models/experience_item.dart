class ExperienceItem {
  const ExperienceItem({
    required this.company,
    required this.role,
    required this.period,
    required this.location,
    required this.bullets,
  });

  final String company;
  final String role;
  final String period;
  final String location;
  final List<String> bullets;
}
