import '../models/education_model.dart';

class EducationData {
  EducationData._();

  static const EducationModel degree = EducationModel(
    degree: 'Bachelor of Computer Applications (BCA)',
    institution: 'Calicut University',
    grade: 'First Class · CGPA 7.21',
    year: '2025',
  );

  static const List<CertificationModel> certifications = [
    CertificationModel(
      title: 'AI Chatbot Development Bootcamp',
      provider: 'UpCode AI',
      year: '2025',
    ),
    CertificationModel(
      title: 'Personal Development Program',
      provider: 'K-DISC',
      year: '2025',
    ),
  ];
}
