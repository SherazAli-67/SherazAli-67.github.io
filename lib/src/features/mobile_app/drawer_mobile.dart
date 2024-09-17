import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/src/provider/scroll_provider.dart';
import 'package:portfolio/src/provider/theme_provider.dart';
import 'package:portfolio/src/themes_styles/theme.dart';
import 'package:provider/provider.dart';
import '../../themes_styles/style_constant.dart';
import '../../data/portfolio_data.dart';

class DrawerMobile extends StatelessWidget{
  const DrawerMobile({super.key,});

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    final scrollProvider = Provider.of<ScrollProvider>(context);
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

                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(navBar['icon'], height: 20, color: isDarkTheme ? Colors.white : Colors.black,),
                    title: IconButton(
                      // iconSize: 25,
                      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      alignment: Alignment.topLeft,
                      onPressed: (){
                        scrollProvider.scroll(index, isTablet: true);
                      },
                      icon: Text(
                        navBar['title'],
                        style: regularTextStyleWeb,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

}