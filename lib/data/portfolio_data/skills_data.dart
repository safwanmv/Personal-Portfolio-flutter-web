import 'package:flutter/material.dart';
import '../models/skill_category_model.dart';

class SkillsData {
  SkillsData._();

  static const List<SkillCategoryModel> categories = [
    SkillCategoryModel(
      title: 'Mobile Development',
      icon: Icons.phone_android_rounded,
      skills: [
        'Flutter',
        'Dart',
        'Responsive UI',
        'Cross-Platform',
        'Flutter Flavors',
      ],
    ),
    SkillCategoryModel(
      title: 'Architecture & State Management',
      icon: Icons.account_tree_rounded,
      skills: [
        'Provider',
        'ChangeNotifier',
        'Repository Pattern',
        'Clean Architecture',
        'Feature-Based Structure',
      ],
    ),
    SkillCategoryModel(
      title: 'APIs & Networking',
      icon: Icons.api_rounded,
      skills: [
        'REST APIs',
        'Dio',
        'JSON Parsing',
        'JWT Auth',
        'Token Refresh',
        'Odoo JSON-RPC',
        'Socket.IO',
        'Error Boundaries',
      ],
    ),
    SkillCategoryModel(
      title: 'Backend & Services',
      icon: Icons.cloud_queue_rounded,
      skills: [
        'Firebase',
        'Firebase FCM',
        'Python',
        'Django',
        'Django REST Framework',
        'Supabase',
      ],
    ),
    SkillCategoryModel(
      title: 'Local Data & Offline',
      icon: Icons.storage_rounded,
      skills: [
        'Hive',
        'SQLite',
        'MySQL',
        'PostgreSQL',
        'Flutter Secure Storage',
        'Offline Synchronization',
      ],
    ),
    SkillCategoryModel(
      title: 'Tools & Release',
      icon: Icons.build_circle_rounded,
      skills: [
        'Git',
        'Bitbucket',
        'Postman',
        'Firebase Crashlytics',
        'Google Play Console',
        'Android App Bundles',
      ],
    ),
    SkillCategoryModel(
      title: 'Also Familiar With',
      icon: Icons.extension_rounded,
      skills: [
        'GetX',
        'GraphQL',
        'Google Maps Integration',
      ],
    ),
  ];
}
