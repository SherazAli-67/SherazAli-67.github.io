import 'package:flutter/material.dart';
import 'package:portfolio/src/data/my_projects.dart';
import 'package:portfolio/src/features/desktop/widgets/project_item_widget_web.dart';
import 'package:portfolio/src/features/tablet_app/widgets/project_item_widget_tablet.dart';
import 'package:portfolio/src/models/projects_model.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../themes_styles/style_constant.dart';
import '../../themes_styles/theme.dart';

class ProjectsPageTablet extends StatefulWidget {
  const ProjectsPageTablet({super.key, this.isMobile = false});
  final bool isMobile;
  @override
  ProjectsPageTabletState createState() => ProjectsPageTabletState();
}

class ProjectsPageTabletState extends State<ProjectsPageTablet> with TickerProviderStateMixin {
  bool showAllProjects = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;

    return Column(
      children: [
        // Animate the size change of the project list
         Center(
          child: Column(
            children: [
              const Text("Projects", style: headingStyleWeb,),
              Text("Some of the noteworthy projects I have built:", textAlign: TextAlign.center, style: TextStyle(fontSize: widget.isMobile ? 16 :  19, fontFamily: 'Montserrat'),)
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
                child: ProjectItemWidgetTablet(key: ValueKey(project.title), isDarkTheme: isDarkTheme, project: project, isMobile: widget.isMobile,),
              );
            }),
          ),
        ),

      ],
    );
  }
}