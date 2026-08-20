import '../models/experience_model.dart';

class ExperienceData {
  ExperienceData._();

  static const ExperienceModel currentRole = ExperienceModel(
    role: 'Junior Flutter Developer',
    company: 'Prosevo Technologies',
    period: 'June 2025 — Present',
    location: 'Kerala, India',
    responsibilities: [
      'Work on 4+ production Flutter applications across field operations, jewellery scheme management, and productivity.',
      'Build new features and resolve issues in live production applications.',
      'Integrate REST APIs, authentication, token refresh, secure storage, and image uploads.',
      'Build offline functionality using Hive, including local caching, drafts, and queued synchronization.',
      'Released DraftIt to Google Play and managed builds through Internal, Closed, Open, and Production tracks.',
      'Set up Firebase Crashlytics for real-time production crash monitoring.',
      'Build reusable UI components strictly from design specifications.',
      'Collaborate closely with backend developers and designers using Git and Bitbucket.',
      'Mentored a trainee developer in Flutter basics, state management, and project architecture.',
    ],
  );
}
