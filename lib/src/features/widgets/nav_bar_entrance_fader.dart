import 'package:flutter/material.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/themes_styles/style_constant.dart';
import 'package:portfolio/src/themes_styles/theme.dart';
import 'package:provider/provider.dart';

import '../../provider/scroll_provider.dart';
import 'entrance_fader.dart';

class NavBarActionButton extends StatelessWidget {
  final String label;
  final int index;
  const NavBarActionButton({
    super.key,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;

    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onHover: (val){},
          onTap: ()=>  scrollProvider.scroll(index),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              label,
              style: regularTextStyleWeb.copyWith(color: isDarkTheme ? Colors.white : Colors.black),
            ),
          ),
        ),

      ),
    );
  }
}