import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/size_constants.dart';
import 'package:portfolio/src/features/mobile_app/header_mobile.dart';
import 'package:portfolio/src/features/tablet_app/feedback_reviews_page_tablet.dart';
import 'package:portfolio/src/features/tablet_app/projects_page_tablet.dart';
import 'package:portfolio/src/provider/scroll_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/string_constant.dart';
import '../../provider/theme_provider.dart';
import '../../themes_styles/style_constant.dart';
import '../../themes_styles/theme.dart';
import '../desktop/about_me_web.dart';
import '../desktop/contact_page.dart';
import '../desktop/experience_page.dart';
import '../desktop/tech_stack_web.dart';

class TabletHomePage extends StatelessWidget{
  const TabletHomePage({super.key, required this.openDrawer});
  final VoidCallback openDrawer;
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    Color textSpanColor = isDarkTheme ? Colors.white : Colors.black;
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return ListView(
      controller: scrollProvider.controller,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderMobile(openDrawer: openDrawer,),
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
              const TechStackWebTablet(childAspectRatio: childAspectRatioTablet,),
              const SizedBox(height: 40,),

             const ProjectsPageTablet(),
              const SizedBox(height: 40,),

              const ExperiencePageWeb(isTablet: true,),
              const SizedBox(height: 40,),

              const FeedbackAndReviewsPageTablet(),
              const SizedBox(height: 20,),
            ],
          ),
        ),

        const ContactPageWeb()
      ],
    );
  }

}