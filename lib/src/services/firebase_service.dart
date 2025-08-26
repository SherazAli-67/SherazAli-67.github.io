import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/projects_model.dart';
import 'package:portfolio/src/models/experience_model.dart';
import 'package:portfolio/src/models/feedback_model.dart';
import 'package:portfolio/src/models/portfolio_model.dart';

class FirebaseService {
  static const String _portfolioDocId = 'TjkcSBqSAgzokqEJCxKN';
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Reference to the main portfolio document
  static DocumentReference get _portfolioDoc => 
      _firestore.collection('portfolio').doc(_portfolioDocId);
  
  // Reference to subcollections
  static CollectionReference get _projectsCollection => 
      _portfolioDoc.collection('projects');
  
  static CollectionReference get _experiencesCollection => 
      _portfolioDoc.collection('experiences');
  
  static CollectionReference get _feedbackCollection => 
      _portfolioDoc.collection('feedbackReviews');

  /// Fetch portfolio basic data (aboutMe, yearsOfExperience, etc.)
  static Future<PortfolioModel?> getPortfolioData() async {
    try {
      final doc = await _portfolioDoc.get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          return PortfolioModel.fromMap(data);
        }
      }
      return null;
    } catch (e) {
      debugPrint('Error fetching portfolio data: $e');
      return null;
    }
  }

  /// Fetch all projects from Firebase
  static Future<List<ProjectsModel>> getProjects() async {
    try {
      final snapshot = await _projectsCollection.get();
      return snapshot.docs
          .map((doc) => ProjectsModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('Error fetching projects: $e');
      return [];
    }
  }

  /// Fetch all experiences from Firebase
  static Future<List<ExperienceModel>> getExperiences({
    Color defaultColor = Colors.black
  }) async {
    try {
      final snapshot = await _experiencesCollection.get();
      return snapshot.docs
          .map((doc) => ExperienceModel.fromMap(
              doc.data() as Map<String, dynamic>, 
              defaultColor: defaultColor
            ))
          .toList();
    } catch (e) {
      debugPrint('Error fetching experiences: $e');
      return [];
    }
  }

  /// Fetch all feedback reviews from Firebase
  static Future<List<FeedbackModel>> getFeedbackReviews() async {
    try {
      final snapshot = await _feedbackCollection.get();
      return snapshot.docs
          .map((doc) => FeedbackModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('Error fetching feedback: $e');
      return [];
    }
  }

  /// Upload portfolio basic data (helper method for initial setup)
  static Future<bool> uploadPortfolioData(PortfolioModel portfolio) async {
    try {
      await _portfolioDoc.set(portfolio.toMap(), SetOptions(merge: true));
      return true;
    } catch (e) {
      debugPrint('Error uploading portfolio data: $e');
      return false;
    }
  }

  /// Upload a project (helper method for initial setup)
  static Future<bool> uploadProject(ProjectsModel project) async {
    try {
      await _projectsCollection.doc(project.id).set(project.toMap());
      return true;
    } catch (e) {
      debugPrint('Error uploading project: $e');
      return false;
    }
  }

  /// Upload multiple projects at once (helper method for initial setup)
  static Future<bool> uploadProjects(List<ProjectsModel> projects) async {
    try {
      WriteBatch batch = _firestore.batch();
      for (ProjectsModel project in projects) {
        batch.set(_projectsCollection.doc(project.id), project.toMap());
      }
      await batch.commit();
      return true;
    } catch (e) {
      debugPrint('Error uploading projects: $e');
      return false;
    }
  }

  /// Upload feedback reviews (helper method for initial setup)
  static Future<bool> uploadFeedbackReviews(List<FeedbackModel> feedbacks) async {
    try {
      WriteBatch batch = _firestore.batch();
      for (FeedbackModel feedback in feedbacks) {
        batch.set(_feedbackCollection.doc(feedback.id), feedback.toMap());
      }
      await batch.commit();
      return true;
    } catch (e) {
      debugPrint('Error uploading feedback: $e');
      return false;
    }
  }
}
