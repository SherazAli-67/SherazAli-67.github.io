class ProjectsModel {
  final String title;
  final String coverPage;
  final String description;
  final List<String> techStackList;
  final String? googlePlay;
  final String? appStore;
  final String? gitHub;
  final bool isArabicText;

  ProjectsModel({
    required this.title,
    required this.coverPage,
    required this.description,
    required this.techStackList,
    this.googlePlay,
    this.appStore,
    this.gitHub,
    this.isArabicText = false
  });
}