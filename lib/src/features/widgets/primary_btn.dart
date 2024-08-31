import 'package:flutter/material.dart';

import '../../themes_styles/style_constant.dart';

class PrimaryBtn extends StatelessWidget{
  const PrimaryBtn({super.key, required this.btnText, required this.onTap});
  final String btnText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber,),
      child: Text(
        btnText,
        style: regularTextStyleWeb.copyWith(color: Colors.white),
      ),
    );
  }

}