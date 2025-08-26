import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/app_colors.dart';
import 'package:portfolio/src/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../constants/string_constant.dart';
import '../../provider/portfolio_data_provider.dart';
import '../../themes_styles/style_constant.dart';

class AboutMeWeb extends StatelessWidget{
  // final Color textSpanColor;
  final bool isMobile;
  final bool isDarkTheme;
  const AboutMeWeb({super.key, this.isMobile= false, required this.isDarkTheme});
  @override
  Widget build(BuildContext context) {
    Color bgColor = isDarkTheme ? Colors.white : Colors.black;
    Color textSpanColor = isDarkTheme ? Colors.white : Colors.black;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(onPressed: (){}, child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 5,
            ),
            Text("Available for work", style: regularTextStyleWeb.copyWith(color: AppColors.primaryColor, fontFamily: fontFamilyMontserrat),)
          ],
        )),

        Row(
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi, I'm a ", style: TextStyle(fontSize: 50, fontFamily: fontFamilyMontserrat, color: textSpanColor, fontWeight: FontWeight.w700),),
                    Text('Mobile App Developer', style: TextStyle(fontSize: 50, fontFamily: 'Poppins', color: textSpanColor, fontWeight: FontWeight.w700),),
                    Consumer<PortfolioDataProvider>(
                      builder: (context, portfolioProvider, child) {
                        String aboutMeText = aboutMe; // fallback

                        if (portfolioProvider.portfolioState == LoadingState.success &&
                            portfolioProvider.portfolioData != null) {
                          final data = portfolioProvider.portfolioData!;
                          aboutMeText = data.shortDescription.isNotEmpty ? data.shortDescription : aboutMe;
                        }

                        if (portfolioProvider.portfolioState == LoadingState.loading) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 100.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                CircularProgressIndicator(),
                                SizedBox(height: 20),
                                Text("Loading about me content...", style: TextStyle(fontFamily: 'Montserrat')),
                              ],
                            ),
                          );
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 100,),
                              child: Text(
                                aboutMeText,
                                textAlign: isMobile ? TextAlign.start : TextAlign.justify,
                                style: regularTextStyleWeb.copyWith(height: 1.5),
                              ),
                            ),
                          ],
                        );
                      },
                    ),


                    const SizedBox(height: 20,),
                    Consumer<PortfolioDataProvider>(
                      builder: (context, portfolioProvider, child) {
                        String resumeLink = myResumeLink; // fallback

                        if (portfolioProvider.portfolioState == LoadingState.success &&
                            portfolioProvider.portfolioData != null) {
                          final data = portfolioProvider.portfolioData!;
                          resumeLink = data.resumeLink.isNotEmpty ? data.resumeLink : myResumeLink;
                        }

                        if (portfolioProvider.portfolioState == LoadingState.loading) {
                          return const SizedBox();
                        }

                        return Row(
                          spacing: 20,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor
                                ),
                                onPressed: (){}, child: Text("Contact Me", style: regularTextStyleWeb.copyWith(color: Colors.white, fontFamily: fontFamilyMontserrat, fontWeight: FontWeight.w600),)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: bgColor
                                ),
                                onPressed: ()=> Utils.portfolioLaunchUrl(resumeLink), child: Text("View Resume", style: regularTextStyleWeb.copyWith(color: isDarkTheme ? Colors.black : Colors.white, fontFamily: fontFamilyMontserrat, fontWeight: FontWeight.w600),)),
                          ],
                        );
                      },
                    ),
                  ],
                )),
          ],
        ),

      ],
    );
  }
}
