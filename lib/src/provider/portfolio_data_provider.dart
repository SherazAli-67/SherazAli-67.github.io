import 'package:flutter/material.dart';
import 'package:portfolio/src/models/portfolio_model.dart';
import 'package:portfolio/src/models/projects_model.dart';
import 'package:portfolio/src/models/experience_model.dart';
import 'package:portfolio/src/models/feedback_model.dart';
import 'package:portfolio/src/services/firebase_service.dart';

enum LoadingState { idle, loading, success, error }

class PortfolioDataProvider extends ChangeNotifier {
  // Data storage
  PortfolioModel? _portfolioData;
  List<ProjectsModel> _projects = [];
  List<ExperienceModel> _experiences = [];
  List<FeedbackModel> _feedbackReviews = [];

  // Loading states
  LoadingState _portfolioState = LoadingState.idle;
  LoadingState _projectsState = LoadingState.idle;
  LoadingState _experiencesState = LoadingState.idle;
  LoadingState _feedbackState = LoadingState.idle;

  // Error messages
  String? _portfolioError;
  String? _projectsError;
  String? _experiencesError;
  String? _feedbackError;

  // Getters for data
  PortfolioModel? get portfolioData => _portfolioData;
  List<ProjectsModel> get projects => _projects;
  List<ExperienceModel> get experiences => _experiences;
  List<FeedbackModel> get feedbackReviews => _feedbackReviews;

  // Getters for loading states
  LoadingState get portfolioState => _portfolioState;
  LoadingState get projectsState => _projectsState;
  LoadingState get experiencesState => _experiencesState;
  LoadingState get feedbackState => _feedbackState;

  // Getters for error messages
  String? get portfolioError => _portfolioError;
  String? get projectsError => _projectsError;
  String? get experiencesError => _experiencesError;
  String? get feedbackError => _feedbackError;

  // Computed getters for convenience
  bool get isLoading => 
      _portfolioState == LoadingState.loading ||
      _projectsState == LoadingState.loading ||
      _experiencesState == LoadingState.loading ||
      _feedbackState == LoadingState.loading;

  bool get hasError => 
      _portfolioState == LoadingState.error ||
      _projectsState == LoadingState.error ||
      _experiencesState == LoadingState.error ||
      _feedbackState == LoadingState.error;

  bool get isAllDataLoaded =>
      _portfolioState == LoadingState.success &&
      _projectsState == LoadingState.success &&
      _experiencesState == LoadingState.success &&
      _feedbackState == LoadingState.success;

  /// Load all portfolio data
  Future<void> loadAllData({Color textColor = Colors.black}) async {
    await Future.wait([
      loadPortfolioData(),
      loadProjects(),
      loadExperiences(textColor: textColor),
      loadFeedbackReviews(),
    ]);
  }

  /// Load portfolio basic data
  Future<void> loadPortfolioData() async {
    _portfolioState = LoadingState.loading;
    _portfolioError = null;
    notifyListeners();

    try {
      final data = await FirebaseService.getPortfolioData();
      if (data != null) {
        _portfolioData = data;
        _portfolioState = LoadingState.success;
      } else {
        _portfolioData = PortfolioModel.empty();
        _portfolioState = LoadingState.error;
        _portfolioError = 'No portfolio data found';
      }
    } catch (e) {
      _portfolioState = LoadingState.error;
      _portfolioError = 'Failed to load portfolio data: $e';
      _portfolioData = PortfolioModel.empty();
    }
    notifyListeners();
  }

  /// Load projects data
  Future<void> loadProjects() async {
    _projectsState = LoadingState.loading;
    _projectsError = null;
    notifyListeners();

    try {
      final projects = await FirebaseService.getProjects();
      _projects = projects;
      _projectsState = projects.isNotEmpty ? LoadingState.success : LoadingState.error;
      if (projects.isEmpty) {
        _projectsError = 'No projects found';
      }
    } catch (e) {
      _projectsState = LoadingState.error;
      _projectsError = 'Failed to load projects: $e';
      _projects = [];
    }
    notifyListeners();
  }

  /// Load experiences data
  Future<void> loadExperiences({Color textColor = Colors.black}) async {
    _experiencesState = LoadingState.loading;
    _experiencesError = null;
    notifyListeners();

    try {
      final experiences = await FirebaseService.getExperiences(defaultColor: textColor);
      _experiences = experiences;
      _experiencesState = experiences.isNotEmpty ? LoadingState.success : LoadingState.error;
      if (experiences.isEmpty) {
        _experiencesError = 'No experiences found';
      }
    } catch (e) {
      _experiencesState = LoadingState.error;
      _experiencesError = 'Failed to load experiences: $e';
      _experiences = [];
    }
    notifyListeners();
  }

  /// Load feedback reviews data
  Future<void> loadFeedbackReviews() async {
    _feedbackState = LoadingState.loading;
    _feedbackError = null;
    notifyListeners();

    try {
      final feedback = await FirebaseService.getFeedbackReviews();
      _feedbackReviews = feedback;
      _feedbackState = feedback.isNotEmpty ? LoadingState.success : LoadingState.error;
      if (feedback.isEmpty) {
        _feedbackError = 'No feedback reviews found';
      }
    } catch (e) {
      _feedbackState = LoadingState.error;
      _feedbackError = 'Failed to load feedback: $e';
      _feedbackReviews = [];
    }
    notifyListeners();
  }

  /// Refresh all data
  Future<void> refreshAllData({Color textColor = Colors.black}) async {
    await loadAllData(textColor: textColor);
  }

  /// Clear all data and reset states
  void clearAllData() {
    _portfolioData = null;
    _projects.clear();
    _experiences.clear();
    _feedbackReviews.clear();
    
    _portfolioState = LoadingState.idle;
    _projectsState = LoadingState.idle;
    _experiencesState = LoadingState.idle;
    _feedbackState = LoadingState.idle;
    
    _portfolioError = null;
    _projectsError = null;
    _experiencesError = null;
    _feedbackError = null;
    
    notifyListeners();
  }
}
