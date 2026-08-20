import '../../core/constants/app_constants.dart';
import '../../core/constants/app_links.dart';

class ProfileData {
  ProfileData._();

  static const String fullName = AppConstants.fullName;
  static const String displayName = AppConstants.displayName;
  static const String primaryTitle = AppConstants.primaryTitle;
  static const String supportingTitle = AppConstants.supportingTitle;
  static const String location = AppConstants.location;
  static const String statusBadgeText = AppConstants.statusBadgeText;
  static const String experiencePeriod = AppConstants.experiencePeriod;

  static const String heroHeadline = AppConstants.heroHeadline;
  static const String heroSubtext = AppConstants.heroSubtext;

  static const String aboutText1 = AppConstants.aboutText1;
  static const String aboutText2 = AppConstants.aboutText2;
  static const String aboutText3 = AppConstants.aboutText3;

  static const String email = AppLinks.email;
  static const String linkedin = AppLinks.linkedin;
  static const String github = AppLinks.github;
  static const String cvPath = AppLinks.cvPath;

  // Real-world proof items for ProofSection
  static const List<Map<String, String>> proofItems = [
    {
      'title': 'Production Apps',
      'detail': 'Worked on 4+ production Flutter applications',
      'tag': '4+ Live Apps'
    },
    {
      'title': 'Offline Support',
      'detail': 'Hive, local caching, drafts, & queued sync',
      'tag': 'Offline First'
    },
    {
      'title': 'API Integration',
      'detail': 'REST APIs, JWT auth, & token refresh handling',
      'tag': 'REST & Dio'
    },
    {
      'title': 'Release Experience',
      'detail': 'Google Play releases & Firebase Crashlytics',
      'tag': 'Production Ready'
    },
  ];
}
