import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/constants/string_constant.dart';
import 'package:portfolio/src/data/portfolio_data.dart';
import 'package:portfolio/src/features/widgets/hover_effected_widget.dart';
import 'package:portfolio/src/features/widgets/primary_btn.dart';
import 'package:portfolio/src/models/tech_stack_model.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/themes_styles/style_constant.dart';
import 'package:portfolio/src/themes_styles/theme.dart';
import 'package:provider/provider.dart';
import 'header_desktop.dart';

class HomePageDesktop extends StatelessWidget{
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    Color textSpanColor = isDarkTheme ? Colors.white : Colors.black;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
      child: ListView(
        children: [
          const HeaderDesktop(),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Hi, I am ", style: TextStyle(fontSize: 24),),
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(text: title, style: TextStyle(fontSize: 70, fontFamily: 'Poppins', color: textSpanColor, fontWeight: FontWeight.w700),),
                            const TextSpan(text: '\nMobile App Developer', style: TextStyle(fontSize: 50, fontFamily: 'Poppins', color: primaryColor, fontWeight: FontWeight.w700),),
                          ]
                      )),
                      const Text(shortDescription, style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),),
                    ],
                  )),
              const SizedBox(width: 20,),
              const Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 150,
                    backgroundImage: NetworkImage(
                        profileUrl
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                PrimaryBtn(btnText: "Hire me", onTap: (){}),
                const SizedBox(width: 10,),
                ElevatedButton(onPressed: (){}, child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Download CV", style: regularTextStyleWeb.copyWith(color: isDarkTheme ? Colors.white : Colors.black)),
                    const SizedBox(width: 8,),
                    SvgPicture.asset(icDownload),
                  ],
                ),)
              ],
            ),
          ),
          const SizedBox(height: 20,),
          const Text("About me",style:  headingStyleWeb,),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 100,),
            child: Text(aboutMe, textAlign: TextAlign.justify, style: regularTextStyleWeb.copyWith(height: 1.5),),
          ),
          const SizedBox(height: 20,),
           const Row(
            children: [
              Text("3+", style: TextStyle(fontSize: 75, fontWeight: FontWeight.w700,color: primaryColor),),
              SizedBox(width: 10,),
              Expanded(child: Text(experienceDescription, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, fontFamily: 'Montserrat'))),
              SizedBox(width: 40,),
            ],
          ),
          const SizedBox(height: 20,),
          const Column(
            children: [
              Text("My Tech Stack", style: headingStyleWeb,),
              Text("Technologies I’ve been working with recently", style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),)
            ],
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 400,
            child: GridView.builder(
                itemCount: PortfolioData.techStackList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 3/1.5),
                itemBuilder: (ctx, index) {
                  TechStackModel techStack = PortfolioData.techStackList[index];
                  return SocialIcon(icon: techStack.icon, color: primaryColor, text: techStack.title);
                  /*return Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all( 15.0),
                      child: SvgPicture.asset(PortfolioData.techStackList[index],),
                    ),
                  );*/
                }),
          )

        ],
      ),
    );
  }

}