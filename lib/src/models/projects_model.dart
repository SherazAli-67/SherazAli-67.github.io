class ProjectsModel {
  final String id;
  final String title;
  final String coverPage;
  final String description;
  final List<String> techStackList;
  final String? googlePlay;
  final String? appStore;
  final String? gitHub;
  final bool isArabicText;

  ProjectsModel({
    required this.id,
    required this.title,
    required this.coverPage,
    required this.description,
    required this.techStackList,
    this.googlePlay,
    this.appStore,
    this.gitHub,
    this.isArabicText = false,
  });

  /// Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'coverPage': coverPage,
      'description': description,
      'techStackList': techStackList,
      'googlePlay': googlePlay,
      'appStore': appStore,
      'gitHub': gitHub,
      'isArabicText': isArabicText,
    };
  }

  /// Create object from Map
  factory ProjectsModel.fromMap(Map<String, dynamic> map) {
    return ProjectsModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      coverPage: map['coverPage'] ?? '',
      description: map['description'] ?? '',
      techStackList: List<String>.from(map['techStackList'] ?? []),
      googlePlay: map['googlePlay'],
      appStore: map['appStore'],
      gitHub: map['gitHub'],
      isArabicText: map['isArabicText'] ?? false,
    );
  }
}