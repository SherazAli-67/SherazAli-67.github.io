import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/constants/string_constant.dart';
import 'package:portfolio/src/features/widgets/primary_btn.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(width: 20,),
              Expanded(
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


          /*const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("About me",style:  headingStyleWeb,),
                    SizedBox(height: 10,),
                    Text(aboutMe, textAlign: TextAlign.justify, style: regularTextStyleWeb,)
                  ],
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
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
          ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, ), child: Text("Get in Touch", style: regularTextStyleWeb.copyWith(color: Colors.white),),)*/
        ],
      ),
    );
  }

}