import 'package:flutter/material.dart';
import '../../constants/string_constant.dart';
import '../../themes_styles/style_constant.dart';

class HeaderTablet extends StatelessWidget{
  const HeaderTablet({super.key, required this.openDrawer});
  final VoidCallback openDrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(logoText, style: headingStyleWeb,),
        const Spacer(),
        IconButton(onPressed: openDrawer, icon: const Icon(Icons.menu)),
        const SizedBox(width: 20,),
      ],
    );
  }

}