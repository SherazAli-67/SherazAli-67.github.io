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
        'icon' : icContact,
        'title' : 'Contact'
      },
    ];
  }

  static List<TechStackModel> get techStackList {
    return [
      TechStackModel(icon: icFlutter, title: 'Flutter'),
      TechStackModel(icon: icDart, title: "Dart"),
      TechStackModel(icon: icAndroid, title: 'Native Android'),
      TechStackModel(icon: icJava, title: 'Java'),
      TechStackModel(icon: icGitHub, title: 'GitHub'),
      TechStackModel(icon: icFirebase, title: 'Firebase'),
      TechStackModel(icon: icMongoDB, title: 'MongoDB'),
      TechStackModel(icon: icPostman, title: "Postman"),
      TechStackModel(icon: icAndroidStudio, title: "Android Studio"),
      TechStackModel(icon: icVisualStudio, title: 'Visual Studio')
    ];
  }
}