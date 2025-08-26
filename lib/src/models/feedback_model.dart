class FeedbackModel {
  final String id;
  final String fromClient;
  final String feedbackText;
  final String platform;
  final String profileUrl;

  FeedbackModel({
    required this.id,
    required this.fromClient,
    required this.feedbackText,
    required this.platform,
    required this.profileUrl,
  });

  /// Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fromClient': fromClient,
      'feedbackText': feedbackText,
      'platform': platform,
      'profileUrl': profileUrl,
    };
  }

  /// Create object from Map
  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      id: map['id'] ?? '',
      fromClient: map['fromClient'] ?? '',
      feedbackText: map['feedbackText'] ?? '',
      platform: map['platform'] ?? '',
      profileUrl: map['profileUrl'] ?? '',
    );
  }
}