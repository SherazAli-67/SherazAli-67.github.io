import 'package:flutter/material.dart';
import 'package:portfolio/src/data/feedback_reviews.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../themes_styles/style_constant.dart';
import '../../themes_styles/theme.dart';
class FeedbackAndReviewsPageWeb extends StatelessWidget{
  const FeedbackAndReviewsPageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    Color cardColor = isDarkTheme ? Colors.black : Colors.white;
    return Column(
      children: [
        const Text("Feedback & Reviews", style: headingStyleWeb,),
        const Text("Words of appreciation from those I’ve had the pleasure to work with", style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: feedbackReviews.map((feedback) {
            return Card(
              color: cardColor,
              elevation: 1,
              child: SizedBox(
                width: size.width*0.25,
                height: size.height*0.43,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white,),
                      ),
                      const SizedBox(height: 20,),

                      Text(feedback.feedbackText, textAlign: TextAlign.center, style: regularTextStyleWeb.copyWith(fontFamily: 'Montserrat'),),
                      const Spacer(),
                      Text(feedback.fromClient, style: subHeadingStyleWeb.copyWith(fontFamily: 'Montserrat'),),

                      Text(feedback.platform),
                      const SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}