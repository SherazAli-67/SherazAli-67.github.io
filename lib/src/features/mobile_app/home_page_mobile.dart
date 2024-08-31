import 'package:flutter/cupertino.dart';

import 'header_mobile.dart';

class HomePageMobile extends StatelessWidget{
  const HomePageMobile({super.key, required this.openDrawer});
  final VoidCallback openDrawer;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        HeaderMobile(openDrawer: openDrawer),
        const SizedBox(height: 20,),
      ],
    );
  }

}