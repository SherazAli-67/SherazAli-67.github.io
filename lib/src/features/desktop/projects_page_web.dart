import 'package:flutter/material.dart';
import 'package:portfolio/src/data/my_projects.dart';
import 'package:portfolio/src/features/desktop/widgets/project_item_widget_web.dart';
import 'package:portfolio/src/models/projects_model.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../themes_styles/style_constant.dart';
import '../../themes_styles/theme.dart';

class ProjectsPageWeb extends StatefulWidget {
  const ProjectsPageWeb({super.key});

  @override
  ProjectsPageWebState createState() => ProjectsPageWebState();
}

class ProjectsPageWebState extends State<ProjectsPageWeb> with TickerProviderStateMixin {
  bool showAllProjects = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    Color cardColor = isDarkTheme ? Colors.black : Colors.white;
    return Column(
      children: [
        // Animate the size change of the project list
        const Center(
          child: Column(
            children: [
              Text("Projects", style: headingStyleWeb,),
              Text("Some of the noteworthy projects I have built:", style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),)
            ],
          ),
        ),
        const SizedBox(height: 20,),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            children: List.generate(3, (index) {
              ProjectsModel project = myProjects[index];
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeIn,  // EaseIn curve for the appearing animation
                switchOutCurve: Curves.easeOut, // EaseOut curve for the disappearing animation
                child: ProjectItemWidgetWeb(key: ValueKey(project.title), cardBgColor: cardColor, project: project),
              );
            }),
          ),
        ),

      ],
    );
  }
}