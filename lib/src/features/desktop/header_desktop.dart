import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/string_constant.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/themes_styles/style_constant.dart';
import 'package:portfolio/src/themes_styles/theme.dart';
import 'package:provider/provider.dart';


class HeaderDesktop extends StatelessWidget{
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<ThemeProvider>(context);
    bool isDarkTheme = provider.themeData == darkTheme;
    Color textIconColor = isDarkTheme ? Colors.white : Colors.black;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Sheraz Ali", style: headingStyleWeb.copyWith(fontFamily: fontFamilyMontserrat, fontSize: 45),),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: textIconColor
                ),
                onPressed: (){}, child: Text("Book a call", style: regularTextStyleWeb.copyWith(color: isDarkTheme ? Colors.black : Colors.white, fontFamily: fontFamilyMontserrat, fontWeight: FontWeight.w600),))
          ],
        ),
      ),
    );
    /*return Row(
      children: [
        Text("$logoText Sheraz", style: headingStyleWeb.copyWith(fontFamily: fontFamilyMontserrat, fontSize: 45),),
        *//*LogoWidget(isDarkTheme: isDarkTheme),*//*
        const Spacer(),
        Row(
          children: List.generate(PortfolioData.navBarList.length, (index){
            String navBarText = PortfolioData.navBarList[index]['title'];
            return NavBarActionButton(label: navBarText, index: index);
          }),
        ),
        ToggleThemeBtn(onToggleThemeTap: ()=> provider.toggleTheme(), isDarkTheme: isDarkTheme),
      ],
    );*/
  }


}

