/*
import 'package:flutter/material.dart';
import 'package:portfolio/src/data/my_projects.dart';
import 'package:portfolio/src/data/my_experiences.dart';
import 'package:portfolio/src/data/feedback_reviews.dart';
import 'package:portfolio/src/models/portfolio_model.dart';
import 'package:portfolio/src/services/firebase_service.dart';

class DataUploader {
  /// Upload all static data to Firebase
  static Future<void> uploadAllData() async {
    try {
      // Upload portfolio basic data
      final portfolioData = PortfolioModel(
        aboutMe: "I'm a passionate Mobile App Developer with 3+ years of experience in creating innovative and user-friendly applications. I specialize in cross-platform development using Flutter and have a strong background in native Android development with Java. My journey in mobile development has been driven by a love for solving complex problems and creating seamless user experiences.",
        yearsOfExperience: 3,
        email: "sherazali67.dev@gmail.com",
        phoneNumber: "+923331234567",
        resumeLink: "https://drive.google.com/file/d/your-resume-link/view",
      );
      
      await FirebaseService.uploadPortfolioData(portfolioData);
      debugPrint('✅ Portfolio data uploaded successfully');

      // Upload projects
      await FirebaseService.uploadProjects(myProjects);
      debugPrint('✅ Projects uploaded successfully');

      // Upload experiences
      Experiences.uploadExperienceToFirebase();
      debugPrint('✅ Experiences uploaded successfully');

      // Upload feedback reviews
      await FirebaseService.uploadFeedbackReviews(feedbackReviews);
      debugPrint('✅ Feedback reviews uploaded successfully');

      debugPrint('🎉 All data uploaded to Firebase successfully!');
    } catch (e) {
      debugPrint('❌ Error uploading data: $e');
    }
  }

  /// Upload only portfolio basic data
  static Future<void> uploadPortfolioData() async {
    try {
      final portfolioData = PortfolioModel(
        aboutMe: "I'm a passionate Mobile App Developer with 3+ years of experience in creating innovative and user-friendly applications. I specialize in cross-platform development using Flutter and have a strong background in native Android development with Java. My journey in mobile development has been driven by a love for solving complex problems and creating seamless user experiences.",
        yearsOfExperience: 3,
        email: "sherazali67.dev@gmail.com",
        phoneNumber: "+923331234567",
        resumeLink: "https://drive.google.com/file/d/your-resume-link/view",
      );
      
      await FirebaseService.uploadPortfolioData(portfolioData);
      debugPrint('✅ Portfolio data uploaded successfully');
    } catch (e) {
      debugPrint('❌ Error uploading portfolio data: $e');
    }
  }

  /// Upload only projects
  static Future<void> uploadProjects() async {
    try {
      await FirebaseService.uploadProjects(myProjects);
      debugPrint('✅ Projects uploaded successfully');
    } catch (e) {
      debugPrint('❌ Error uploading projects: $e');
    }
  }

  /// Upload only experiences  
  static Future<void> uploadExperiences() async {
    try {
      Experiences.uploadExperienceToFirebase();
      debugPrint('✅ Experiences uploaded successfully');
    } catch (e) {
      debugPrint('❌ Error uploading experiences: $e');
    }
  }

  /// Upload only feedback reviews
  static Future<void> uploadFeedbackReviews() async {
    try {
      await FirebaseService.uploadFeedbackReviews(feedbackReviews);
      debugPrint('✅ Feedback reviews uploaded successfully');
    } catch (e) {
      debugPrint('❌ Error uploading feedback: $e');
    }
  }
}
*/
