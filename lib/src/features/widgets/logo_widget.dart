import 'package:flutter/material.dart';
import '../../constants/app_icons.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Image.asset(isDarkTheme ? icLogoDarkTheme : icLogoLightTheme, height: 100,);
  }
}