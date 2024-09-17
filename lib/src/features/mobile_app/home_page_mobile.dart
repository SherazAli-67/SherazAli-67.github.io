import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/constants/size_constants.dart';
import 'package:portfolio/src/constants/string_constant.dart';
import 'package:portfolio/src/features/desktop/contact_page.dart';
import 'package:portfolio/src/features/mobile_app/experience_page_mobile.dart';
import 'package:portfolio/src/features/mobile_app/feedback_reviews_page_mobile.dart';
import 'package:portfolio/src/features/mobile_app/tech_stack_mobile.dart';
import 'package:portfolio/src/features/tablet_app/projects_page_tablet.dart';
import 'package:portfolio/src/features/widgets/developer_profile.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../themes_styles/style_constant.dart';
import '../../themes_styles/theme.dart';
import '../../utils/utils.dart';
import '../widgets/primary_btn.dart';
import 'header_mobile.dart';

class HomePageMobile extends StatelessWidget{
  const HomePageMobile({super.key, required this.openDrawer});
  final VoidCallback openDrawer;

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.themeData == darkTheme;
    Color textSpanColor = isDarkTheme ? Colors.white : Colors.black;
    final TextStyle lightTextStyle =  TextStyle(fontSize: 14, height: 1.5, fontFamily: 'Montserrat', color: textSpanColor);
    final TextStyle boldTextStyle =  TextStyle(fontSize: 14, height: 1.5, fontFamily: 'Montserrat', fontWeight: FontWeight.w500,  color: textSpanColor);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              HeaderMobile(openDrawer: openDrawer, isMobile: true,),
              const SizedBox(height: 20,),
              const DeveloperProfile(profileUrl: icDeveloperMe, size: 175),
              const SizedBox(height: 20,),
               Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const Text('Hello, I am Sheraz Ali', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                      const SizedBox(height: 10,),
                      AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText('Mobile App Developer', textStyle: const TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                        TyperAnimatedText('Cross Platform Development', textStyle: const TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                        TyperAnimatedText('Native Android App Development', textStyle: const TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                      ]),
                    ],
                  )),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                  children: [
                    buildLightTextSpanWiget('Self-taught mobile app developer with ',lightTextStyle),
                    buildBoldTextSpan('3+ ',boldTextStyle),
                    buildLightTextSpanWiget('years of experience, specializing in ',lightTextStyle),
                    buildBoldTextSpan('Flutter & Native Android. ',boldTextStyle),
                    buildLightTextSpanWiget('I’ve worked across various industries, including ',lightTextStyle),
                    buildBoldTextSpan('AI apps ',boldTextStyle),
                    buildLightTextSpanWiget('with ',lightTextStyle),
                    buildBoldTextSpan('ChatGPT ',boldTextStyle),
                    buildLightTextSpanWiget('and ',lightTextStyle),
                    buildBoldTextSpan('Text-to-Speech, E-commerce, Translation, Communication, Stock Market, ', boldTextStyle),
                    buildLightTextSpanWiget('and ',lightTextStyle),
                    buildBoldTextSpan('book summary app',boldTextStyle),
                  ]
                )),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: PrimaryBtn(btnText: "Hire me", onTap: (){}),),
                    const SizedBox(width: 20,),
                    Expanded(child: ElevatedButton(onPressed: (){
                      Utils.portfolioLaunchUrl(myResumeLink);
                    }, child:  Text("My RESUME", style: regularTextStyleWeb.copyWith(color: textSpanColor, fontFamily: 'Montserrat', fontWeight: FontWeight.w700)),))

                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const TechStackMobile(childAspectRatio: childAspectRatioTablet),
              const SizedBox(height: 20,),
              const ProjectsPageTablet(isMobile: true),
              const SizedBox(height: 20,),

              const ExperiencePageMobile(),
              const FeedbackAndReviewsPageMobile(),
              // Text(aboutMeMobileDescription, style: TextStyle(fontSize: 14, height: 1.5, fontFamily: 'Montserrat',),)
              /*
              AboutMeWeb(textSpanColor: isDarkTheme ? Colors.white : Colors.black, isMobile: true,)*/
            ],
          ),
        ),
        const ContactPageWeb(isMobile: true,)
      ],
    );
  }

  TextSpan buildBoldTextSpan(String text, TextStyle boldTextStyle) {
    return TextSpan(text: text, style: boldTextStyle);
  }

  TextSpan buildLightTextSpanWiget(String text, TextStyle lightTextStyle) {
    return TextSpan(
              text: text, style: lightTextStyle
            );
  }

}