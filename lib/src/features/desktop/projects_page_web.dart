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
    Size size = MediaQuery.of(context).size;
    return Consumer<PortfolioDataProvider>(
      builder: (context, portfolioProvider, child) {
        // Initialize data loading if not started
        if (portfolioProvider.projectsState == LoadingState.idle) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            portfolioProvider.loadProjects();
          });
        }
        if(portfolioProvider.projectsState == LoadingState.success){
          final projects = portfolioProvider.projects;
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

          return Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Selected Work", style: headingStyleWeb),
                  const SizedBox(height: 20),
                  _buildProjectsLayout(projects, cardColor),
                ],
              ),
            ),
          );
        }

        return const SizedBox();
        /*return Column(
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
        );*/
      },
    );
  }

  Widget _buildProjectsLayout(List<ProjectsModel> projects, Color cardColor) {
    if (projects.isEmpty) return const SizedBox.shrink();

    List<Widget> layoutChildren = [];

    // First project - full width
    if (projects.isNotEmpty) {
      layoutChildren.add(
        ProjectItemWidgetWeb(
          project: projects[0],
          cardBgColor: cardColor,
        ),
      );
      layoutChildren.add(const SizedBox(height: 20));
    }

    // Remaining projects - two per row
    if (projects.length > 1) {
      final remainingProjects = projects.sublist(1);
      
      for (int i = 0; i < remainingProjects.length; i += 2) {
        List<Widget> rowChildren = [];
        
        // First project in the row
        rowChildren.add(
          Expanded(
            child: ProjectItemWidgetWeb(
              project: remainingProjects[i],
              cardBgColor: cardColor,
            ),
          ),
        );

        // Second project in the row (if exists)
        if (i + 1 < remainingProjects.length) {
          rowChildren.add(const SizedBox(width: 20));
          rowChildren.add(
            Expanded(
              child: ProjectItemWidgetWeb(
                project: remainingProjects[i + 1],
                cardBgColor: cardColor,
              ),
            ),
          );
        } else {
          // If odd number of remaining projects, add empty space
          rowChildren.add(const SizedBox(width: 20));
          rowChildren.add(const Expanded(child: SizedBox()));
        }

        layoutChildren.add(
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: rowChildren,
            ),
          ),
        );

        // Add spacing between rows (except for the last row)
        if (i + 2 < remainingProjects.length) {
          layoutChildren.add(const SizedBox(height: 20));
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: layoutChildren,
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
