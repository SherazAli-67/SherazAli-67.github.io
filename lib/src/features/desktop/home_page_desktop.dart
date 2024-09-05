import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/string_constant.dart';
import 'package:portfolio/src/features/desktop/experience_page.dart';
import 'package:portfolio/src/features/desktop/about_me_web.dart';
import 'package:portfolio/src/features/desktop/projects_page_web.dart';
import 'package:portfolio/src/features/desktop/tech_stack_web.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/themes_styles/style_constant.dart';
import 'package:portfolio/src/themes_styles/theme.dart';
import 'package:provider/provider.dart';
import 'contact_page.dart';
import 'feedback_reviews_page_web.dart';
import 'header_desktop.dart';

class HomePageWeb extends StatelessWidget{
  const HomePageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    Color textSpanColor = isDarkTheme ? Colors.white : Colors.black;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderDesktop(),
              const SizedBox(height: 20,),

              AboutMeWeb(textSpanColor: textSpanColor),
              const SizedBox(height: 20,),

              const Row(children: [
                  Text("3+", style: TextStyle(fontSize: 75, fontWeight: FontWeight.w700,color: primaryColor),),
                  SizedBox(width: 10,),
                  Expanded(child: Text(experienceDescription, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, fontFamily: 'Montserrat'))),
                  SizedBox(width: 40,),
                ],),
              const SizedBox(height: 20,),
              const TechStackWeb(),
              const SizedBox(height: 40,),

              const ProjectsPageWeb(),
              const SizedBox(height: 40,),

              const ExperiencePageWeb(),
              const SizedBox(height: 40,)
              ,
              const FeedbackAndReviewsPageWeb(),
              const SizedBox(height: 20,),
            ],
          ),
        ),

        const ContactPageWeb()
      ],
    );
  }
}
