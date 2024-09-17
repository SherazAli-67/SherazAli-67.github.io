import 'package:flutter/material.dart';
import 'package:portfolio/src/data/my_experiences.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_provider.dart';
import '../../themes_styles/style_constant.dart';
import '../../themes_styles/theme.dart';

class ExperiencePageWeb extends StatelessWidget{
  const ExperiencePageWeb({super.key, this.isTablet = false});
  final bool isTablet;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    Color cardColor = isDarkTheme ? Colors.black : Colors.white;
    Color textSpanColor = isDarkTheme ? Colors.white : Colors.black;
    return  Column(
      children: [
        const Text("Experience", style: headingStyleWeb,),
        const Text("Here is a quick summary of my most recent experiences:", style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),),
        const SizedBox(height: 10,),
        Column(
          children: Experiences.getMyExperiences(textSpanColor: textSpanColor).map((experience){
            return Card(
              color: cardColor,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(experience.companyIcon, height: 45,),
                    const SizedBox(width: 20,),
                    Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(experience.title, style: subHeadingStyleWeb,),
                                  if(isTablet)
                                  Text(experience.duration, style: regularTextStyleWeb,),

                                  const SizedBox(height: 10,),
                                  Column(
                                      children: experience.keyResponsibilities.map((accomplishment){
                                        return SizedBox(
                                          width: size.width*0.75,
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 15.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text("\u2022", style: subHeadingStyleWeb,),
                                                const SizedBox(width: 5,),
                                                Expanded(child: RichText(text: accomplishment)),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                ],
                              ),
                            ),
                            if(!isTablet)
                              Column(
                                children: [

                                  const SizedBox(width: 20,),
                                  Text(experience.duration, style: regularTextStyleWeb,)
                                ],
                              )
                          ],
                        ))

                  ],
                ),
              ),
            );
          }).toList()
        )
      ],
    );
  }

}