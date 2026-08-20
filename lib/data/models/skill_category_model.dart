import 'package:flutter/material.dart';

class SkillCategoryModel {
  final String title;
  final IconData icon;
  final List<String> skills;

  const SkillCategoryModel({
    required this.title,
    required this.icon,
    required this.skills,
  });
}
