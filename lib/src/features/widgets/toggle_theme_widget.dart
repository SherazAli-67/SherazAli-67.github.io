import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_icons.dart';

class ToggleThemeBtn extends StatelessWidget {
  const ToggleThemeBtn({
    super.key,
    required this.onToggleThemeTap,
    required this.isDarkTheme,
  });
  final VoidCallback onToggleThemeTap;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onToggleThemeTap,
      icon: isDarkTheme
          ? SvgPicture.asset(icDarkThemeEnabled)
          : SvgPicture.asset(icLightThemeEnabled),
    );
  }
}