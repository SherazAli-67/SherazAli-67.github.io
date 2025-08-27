import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/models/services_model.dart';
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
      // TechStackModel(icon: icDart, title: "Dart", color: const Color(0xff01579B)),
      // TechStackModel(icon: icAndroid, title: 'Native Android', color: const Color(0xff84BF41)),
      // TechStackModel(icon: icJava, title: 'Java', color: const Color(0xff5382A1)),
      TechStackModel(icon: icFirebase, title: 'Firebase', color: const Color(0xffFCCA3F)),
      TechStackModel(icon: icMongoDB, title: 'MongoDB', color: const Color(0xff58AA50)),
      TechStackModel(icon: icGitHub, title: 'GitHub', color: Colors.black),
      TechStackModel(icon: icPostman, title: "Postman", color: const Color(0xffFF6C37)),
      // TechStackModel(icon: icAndroidStudio, title: "Android Studio", color: const Color(0xff4285F4)),
      // TechStackModel(icon: icVisualStudio, title: 'Visual Studio', color: const Color(0xff1F9CF0))
    ];
  }

  static List<String> get techStackIcons {
    return [
      'assets/icons/flutter.png',
      'assets/icons/firebase.png',
      'assets/icons/stripe.png',
      'assets/icons/ic_google_play.png',
      'assets/icons/app_store.png'
    ];
  }

  static List<ServicesIOffer> get howCanIAssistInfo {
    return [
     ServicesIOffer(id: '1', title: 'Mobile App Development', iconUrl: icFlutter, description: 'I build reliable, cross-platform apps with Flutter, ensuring smooth performance, scalability, and beautiful design across iOS and Android.'),
      ServicesIOffer(id: '2', title: 'Custom Feature Integration', iconUrl: icFirebase, description: 'From AI chatbots to payment systems and real-time communication, I integrate advanced features tailored to your business needs.'),
      ServicesIOffer(id: '3', title: 'App Maintenance & Scaling', iconUrl: icGitHub, description: 'I provide ongoing support, updates, and scaling solutions to keep your app fast, secure, and aligned with user growth.'),
      ServicesIOffer(id: '4', title: 'Consultation & MVP Development', iconUrl: icPostman, description: 'I help startups turn ideas into working MVPs, validating concepts quickly with cost-effective mobile solutions.'),

    ];
  }
}