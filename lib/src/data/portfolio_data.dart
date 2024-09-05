import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/models/tech_stack_model.dart';

class PortfolioData {
  static List<Map<String, dynamic>> get navBarList {
    return [
      {
        'icon' : icHome,
        'title' : 'Home'
      },
      {
        'icon' : icUser,
        'title' : 'About me'
      },
      {
        'icon' : icSkills,
        'title' : 'Tech Stack'
      },
      {
        'icon' : icProjects,
        'title' : 'Project'
      },
      {
        'icon' : icSkills,
        'title' : 'Experience'
      },
      {
        'icon' : icProjects,
        'title' : 'Feedback'
      },
      {
        'icon' : icContact,
        'title' : 'Contact'
      },
    ];
  }

  static List<TechStackModel> get techStackList {
    return [
      TechStackModel(icon: icFlutter, title: 'Flutter', color: const Color(0xff47C5FB)),
      TechStackModel(icon: icDart, title: "Dart", color: const Color(0xff01579B)),
      TechStackModel(icon: icAndroid, title: 'Native Android', color: const Color(0xff84BF41)),
      TechStackModel(icon: icJava, title: 'Java', color: const Color(0xff5382A1)),
      TechStackModel(icon: icGitHub, title: 'GitHub', color: Colors.black),
      TechStackModel(icon: icFirebase, title: 'Firebase', color: const Color(0xffFCCA3F)),
      TechStackModel(icon: icMongoDB, title: 'MongoDB', color: const Color(0xff58AA50)),
      TechStackModel(icon: icPostman, title: "Postman", color: const Color(0xffFF6C37)),
      TechStackModel(icon: icAndroidStudio, title: "Android Studio", color: const Color(0xff4285F4)),
      TechStackModel(icon: icVisualStudio, title: 'Visual Studio', color: const Color(0xff1F9CF0))
    ];
  }
}