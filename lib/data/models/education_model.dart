class EducationModel {
  final String degree;
  final String institution;
  final String grade;
  final String year;

  const EducationModel({
    required this.degree,
    required this.institution,
    required this.grade,
    required this.year,
  });
}

class CertificationModel {
  final String title;
  final String provider;
  final String year;

  const CertificationModel({
    required this.title,
    required this.provider,
    required this.year,
  });
}
