import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../themes_styles/style_constant.dart';
import '../../data/portfolio_data.dart';

class DrawerMobile extends StatelessWidget{
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: const Icon(Icons.close)),
            Expanded(
              child: ListView(
                children: List.generate(PortfolioData.navBarList.length, (index) {
                  Map<String, dynamic> navBar = PortfolioData.navBarList[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    leading: SvgPicture.asset(navBar['icon'], height: 20,),title: Text(navBar['title'], style: regularTextStyleWeb,),);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

}