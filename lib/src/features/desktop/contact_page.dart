import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/constants/string_constant.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/themes_styles/style_constant.dart';
import 'package:portfolio/src/themes_styles/theme.dart';
import 'package:portfolio/src/utils/utils.dart';
import 'package:provider/provider.dart';

class ContactPageWeb extends StatelessWidget{
  const ContactPageWeb({super.key, this.isMobile = false});
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    Color cardColor = isDarkTheme ? Colors.black : Colors.white;
    TextStyle textStyle = isMobile ? TextStyle(fontSize: 16, fontWeight: FontWeight.w600) : subHeadingStyleWeb;
    return Card(
      margin: EdgeInsets.zero,
      color: cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
      ),
      child: Padding(
        padding:  const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(99)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: const Text("Get in touch", style: TextStyle(fontSize: 14,), ),
            ),
            const SizedBox(height: 20,),
            Text('What’s next? Feel free to reach out to me if you\'re looking for a developer, have a query, or simply want to connect.', textAlign: TextAlign.center, style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat'),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(icMail, color: Colors.grey, height: 20,),
                const SizedBox(width: 10,),
                Text(myEmail, style: textStyle,),
                const SizedBox(width: 10,),
               IconButton(onPressed: ()async{
                 await Clipboard.setData(const ClipboardData(text: myEmail));
                 Utils.showToastMessage();
               }, icon:  SvgPicture.asset(icCopy,  color: Colors.grey, height: 25,),)
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(icContactPhone, color: Colors.grey, height: 20,),
                const SizedBox(width: 10,),
                 Text(myContactNum, style: textStyle,),
                const SizedBox(width: 10,),
                IconButton(onPressed: ()async{
                  await Clipboard.setData(const ClipboardData(text: myContactNum));
                  Utils.showToastMessage();
                }, icon:  SvgPicture.asset(icCopy,  color: Colors.grey, height: 25,),)
              ],
            ),
            const SizedBox(height: 40,),
            const Text("You can also find me on these platforms",style: TextStyle(fontSize: 14, fontFamily: 'Montserrat'),),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: ()=> Utils.portfolioLaunchUrl(myGitHubLink), icon: SvgPicture.asset(icLinkToGithub)),
                IconButton(onPressed: ()=> Utils.portfolioLaunchUrl(myTwitterLink), icon: SvgPicture.asset(icLinkToTwitter)),
                IconButton(onPressed: ()=> Utils.portfolioLaunchUrl(myLinkedInLink), icon: SvgPicture.asset(icLinkToLinkedIn)),

              ],
            )
          ],
        ),
      ),
    );
  }
}