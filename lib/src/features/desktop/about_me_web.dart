import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/app_icons.dart';
import '../../constants/string_constant.dart';
import '../../themes_styles/style_constant.dart';
import '../../utils/utils.dart';
import '../widgets/primary_btn.dart';

class AboutMeWeb extends StatelessWidget{
  final Color textSpanColor;
  final bool isMobile;
  const AboutMeWeb({super.key, required this.textSpanColor, this.isMobile= false});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Hi, I am ", style: TextStyle(fontSize: 24),),
                    Text(title, style: TextStyle(fontSize: 50, fontFamily: 'Poppins', color: textSpanColor, fontWeight: FontWeight.w700),),
                    AnimatedTextKit(animatedTexts: [
                      TyperAnimatedText('Mobile App Developer', textStyle: const TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                      TyperAnimatedText('Cross Platform Development', textStyle: const TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                      TyperAnimatedText('Native Android App Development', textStyle: const TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                    ]),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildIconPressButton(icLinkToGithub, ()=> Utils.portfolioLaunchUrl(myGitHubLink)),
                        _buildIconPressButton(icLinkToTwitter, ()=> Utils.portfolioLaunchUrl(myTwitterLink)),
                        _buildIconPressButton(icLinkToLinkedIn,()=> Utils.portfolioLaunchUrl(myLinkedInLink)),
                      ],
                    )
                    /*const SizedBox(height: 40,),
                          const Text(shortDescription, style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),),*/
                  ],
                )),
          ],
        ),
        const SizedBox(height: 40,),
        SizedBox(
          height: 45,
          child: Row(
            children: [
              PrimaryBtn(btnText: "Hire me", onTap: (){
                Utils.launchEmail();
              }),
              const SizedBox(width: 10,),
              ElevatedButton(onPressed: (){
                Utils.portfolioLaunchUrl(myResumeLink);
              }, child:  Text("My RESUME", style: regularTextStyleWeb.copyWith(color: textSpanColor, fontFamily: 'Montserrat', fontWeight: FontWeight.w700)),)
            ],
          ),
        ),
        const SizedBox(height: 20,),
        const Text("About me",style:  headingStyleWeb,),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(right: 100,),
          child: Text(aboutMe, textAlign: isMobile ? TextAlign.start : TextAlign.justify, style: regularTextStyleWeb.copyWith(height: 1.5),),
        ),
      ],
    );
  }

  Widget _buildIconPressButton(String icon, VoidCallback onTap) => Padding(
    padding: const EdgeInsets.only(top: 20.0, right: 20),
    child: InkWell(onTap: onTap, child: SvgPicture.asset(icon, color: Colors.grey, height: 35,)),
  );
}