import 'package:flutter/material.dart';
import 'package:portfolio/src/features/desktop/widgets/project_item_widget_web.dart';
import 'package:portfolio/src/models/projects_model.dart';
import 'package:portfolio/src/provider/portfolio_data_provider.dart';
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
    
    return Consumer<PortfolioDataProvider>(
      builder: (context, portfolioProvider, child) {
        // Initialize data loading if not started
        if (portfolioProvider.projectsState == LoadingState.idle) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            portfolioProvider.loadProjects();
          });
        }

        return Column(
          children: [
            // Header section
            const Center(
              child: Column(
                children: [
                  Text("Projects", style: headingStyleWeb,),
                  Text("Some of the noteworthy projects I have built:", style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),)
                ],
              ),
            ),
            const SizedBox(height: 20,),
            
            // Content based on loading state
            _buildProjectsContent(portfolioProvider, cardColor),
          ],
        );
      },
    );
  }

  Widget _buildProjectsContent(PortfolioDataProvider provider, Color cardColor) {
    switch (provider.projectsState) {
      case LoadingState.loading:
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(50.0),
            child: CircularProgressIndicator(),
          ),
        );
      
      case LoadingState.error:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                const Icon(Icons.error_outline, size: 50, color: Colors.red),
                const SizedBox(height: 10),
                const Text(
                  'Failed to load projects',
                  style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => provider.loadProjects(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      
      case LoadingState.success:
        final projects = provider.projects;
        if (projects.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(
                'No projects found',
                style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
              ),
            ),
          );
        }
        
        return AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            children: List.generate(
              projects.length > 3 ? 3 : projects.length,
              (index) {
                ProjectsModel project = projects[index];
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  child: ProjectItemWidgetWeb(
                    key: ValueKey(project.title), 
                    cardBgColor: cardColor, 
                    project: project
                  ),
                );
              },
            ),
          ),
        );
      
      default:
        return const SizedBox.shrink();
    }
  }
}
