import 'package:flutter/material.dart';
import 'package:portfolio/src/features/widgets/logo_widget.dart';
import 'package:portfolio/src/features/widgets/toggle_theme_widget.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/themes_styles/theme.dart';
import 'package:provider/provider.dart';
import '../../constants/string_constant.dart';
import '../../themes_styles/style_constant.dart';

class HeaderMobile extends StatelessWidget{
  const HeaderMobile({super.key, required this.openDrawer, this.isMobile = false});
  final VoidCallback openDrawer;
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkTheme = themeProvider.themeData == darkTheme;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: LogoWidget(isDarkTheme: isDarkTheme),
        ),
        const Spacer(),
        ToggleThemeBtn(onToggleThemeTap: ()=> themeProvider.toggleTheme(), isDarkTheme: isDarkTheme),
        const SizedBox(width: 20,),
        if(!isMobile)
          Row(
            children: [
              IconButton(onPressed: openDrawer, icon: const Icon(Icons.menu)),
              const SizedBox(width: 20,),
            ],
          ),

      ],
    );
  }

}