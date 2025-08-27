import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/constants/app_colors.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/constants/size_constants.dart';
import 'package:portfolio/src/data/portfolio_data.dart';
import 'package:portfolio/src/features/desktop/experience_page.dart';
import 'package:portfolio/src/features/desktop/about_me_web.dart';
import 'package:portfolio/src/features/desktop/projects_page_web.dart';
import 'package:portfolio/src/features/desktop/tech_stack_web.dart';
import 'package:portfolio/src/models/services_model.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/provider/portfolio_data_provider.dart';
import 'package:portfolio/src/themes_styles/style_constant.dart';
import 'package:portfolio/src/themes_styles/theme.dart';
import 'package:provider/provider.dart';
import '../../provider/scroll_provider.dart';
import 'contact_page.dart';
import 'feedback_reviews_page_web.dart';
import 'header_desktop.dart';

class HomePageWeb extends StatefulWidget{
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  @override
  void initState() {
    super.initState();
    // Initialize data loading
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final portfolioProvider = Provider.of<PortfolioDataProvider>(context, listen: false);
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      Color textColor = themeProvider.themeData == darkTheme ? Colors.white : Colors.black;
      
      if (portfolioProvider.portfolioState == LoadingState.idle) {
        portfolioProvider.loadAllData(textColor: textColor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return Consumer<PortfolioDataProvider>(
      builder: (context, portfolioProvider, child) {
        return ListView(
          controller: scrollProvider.controller,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 40,
                children: [
                  const HeaderDesktop(),

                  AboutMeWeb(isDarkTheme: isDarkTheme),

                  // _buildExperienceSection(portfolioProvider),

                  _buildMyMissionWidget(portfolioProvider),
                  _buildHowCanIAssistWidget(portfolioProvider, isDarkTheme),
                  // const TechStackWebTablet(childAspectRatio: childAspectRatioWeb,),

                  const ProjectsPageWeb(),

                  const ExperiencePageWeb(),
                  const FeedbackAndReviewsPageWeb(),
                ],
              ),
            ),

            const ContactPageWeb()
          ],
        );
      },
    );
  }

  Widget _buildMyMissionWidget(PortfolioDataProvider provider){
    String missionText = ""; // Default fallback

    if (provider.portfolioState == LoadingState.success && provider.portfolioData != null) {
      missionText = provider.portfolioData!.myMissionText;
    } else if (provider.portfolioState == LoadingState.loading) {
      missionText = "...";
    }

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor.withValues(alpha: 0.1)
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        spacing: 25,
        children: [
          Text(missionText, style: headingStyleWeb.copyWith(color: Colors.white),),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Row(
              children: PortfolioData.techStackIcons.map((tech){
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child:  Image.asset(tech, height: 50,),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHowCanIAssistWidget(PortfolioDataProvider provider, bool isDarkTheme){
    String missionText = ""; // Default fallback

    if (provider.portfolioState == LoadingState.success && provider.portfolioData != null) {
      missionText = provider.portfolioData!.myMissionText;
    } else if (provider.portfolioState == LoadingState.loading) {
      missionText = "...";
    }

    Color textIconColor = isDarkTheme ? Colors.white : Colors.black;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        const Text("How Can I Assist You?", style: headingStyleWeb,),
       Expanded(
         child: Column(
           spacing: 20,
           children: [
             Row(
               spacing: 20,
               children: [
                 Expanded(child: _buildAssistWidget(service: PortfolioData.howCanIAssistInfo[0], textIconColor: textIconColor, index: 1),),
                 Expanded(child: _buildAssistWidget(service: PortfolioData.howCanIAssistInfo[1], textIconColor: textIconColor, index: 2),)
               ],
             ),
             Row(
               spacing: 20,
               children: [
                 Expanded(child: _buildAssistWidget(service: PortfolioData.howCanIAssistInfo[2], textIconColor: textIconColor, index: 2),),
                 Expanded(child: _buildAssistWidget(service: PortfolioData.howCanIAssistInfo[3], textIconColor: textIconColor, index: 3),)
               ],
             ),
           ],
         ),
       )
      ],
    );
  }

  Card _buildAssistWidget({required ServicesIOffer service, required int index,  required Color textIconColor}) {
    return Card(
               child: Padding(
                 padding: const EdgeInsets.all(25.0),
                 child: Column(
                   spacing: 20,
                   children: [
                     Row(
                       spacing: 20,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SvgPicture.asset(service.iconUrl, height: 45, ),
                         Expanded(child: Text(service.description, style: regularTextStyleWeb,)),
                       ],
                     ),
                     Row(
                       spacing: 10,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(service.title, style: subHeadingStyleWeb,),
                         Text('0$index', style: subHeadingStyleWeb,)
                       ],
                     )
                   ],),
               )
           );
  }
}
