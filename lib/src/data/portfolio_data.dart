import 'package:portfolio/src/constants/app_icons.dart';

class PortfolioData {
  static List<Map<String, dynamic>> get navBarList {
    return [
      {
        'icon' : icHome,
        'title' : 'Home'
      },
      {
        'icon' : icSkills,
        'title' : 'Skills'
      },
      {
        'icon' : icProjects,
        'title' : 'Project'
      },
      {
        'icon' : icBlogs,
        'title' : 'Blog'
      },
      {
        'icon' : icContact,
        'title' : 'Contact'
      },
    ];
  }
}