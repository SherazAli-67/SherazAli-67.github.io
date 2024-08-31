import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/constants/string_constant.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/themes_styles/style_constant.dart';
import 'package:portfolio/src/data/portfolio_data.dart';
import 'package:portfolio/src/themes_styles/theme.dart';
import 'package:provider/provider.dart';

class HeaderDesktop extends StatelessWidget{
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<ThemeProvider>(context);
    bool isDarkTheme = provider.themeData == darkTheme;
    return Row(
      children: [
        SvgPicture.asset(icAppIcon),
        const Spacer(),
        Row(
          children: List.generate(PortfolioData.navBarList.length, (index){
            String navBarText = PortfolioData.navBarList[index]['title'];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(navBarText, style: regularTextStyleWeb,),
            );
          }),
        ),
        GestureDetector(
          onTap: ()=> provider.toggleTheme(),
          child: isDarkTheme
              ? SvgPicture.asset(icDarkThemeEnabled)
              : SvgPicture.asset(icLightThemeEnabled),
        ),
        const SizedBox(width: 20,),
      ],
    );
  }
}