import 'package:flutter/cupertino.dart';

class ExperienceModel {
  final String title;
  final List<TextSpan> keyResponsibilities;
  final String duration;
  final String companyIcon;

  ExperienceModel({
    required this.title,
    required this.duration,
    required this.keyResponsibilities,
    required this.companyIcon,
  });
}