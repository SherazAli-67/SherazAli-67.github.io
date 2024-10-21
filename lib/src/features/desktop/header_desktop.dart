import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/features/widgets/nav_bar_entrance_fader.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/data/portfolio_data.dart';
import 'package:portfolio/src/themes_styles/theme.dart';
import 'package:provider/provider.dart';

import '../widgets/logo_widget.dart';
import '../widgets/toggle_theme_widget.dart';

class HeaderDesktop extends StatelessWidget{
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<ThemeProvider>(context);
    bool isDarkTheme = provider.themeData == darkTheme;
    return Row(
      children: [
        LogoWidget(isDarkTheme: isDarkTheme),
        const Spacer(),
        Row(
          children: List.generate(PortfolioData.navBarList.length, (index){
            String navBarText = PortfolioData.navBarList[index]['title'];
            return NavBarActionButton(label: navBarText, index: index);
          }),
        ),
        ToggleThemeBtn(onToggleThemeTap: ()=> provider.toggleTheme(), isDarkTheme: isDarkTheme),
        const SizedBox(width: 20,),
      ],
    );
  }
}

