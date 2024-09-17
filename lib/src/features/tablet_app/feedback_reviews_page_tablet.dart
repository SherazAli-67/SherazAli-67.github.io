import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/constants/size_constants.dart';
import 'package:portfolio/src/data/feedback_reviews.dart';
import 'package:portfolio/src/models/feedback_model.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../themes_styles/style_constant.dart';
import '../../themes_styles/theme.dart';
class FeedbackAndReviewsPageTablet extends StatelessWidget{
  const FeedbackAndReviewsPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    Color cardColor = isDarkTheme ? Colors.black : Colors.white;
    return Center(
      child: Column(
        children: [
          const Text("Feedback & Reviews", style: headingStyleWeb,),
          const Text("Words of appreciation from those I’ve had the pleasure to work with", style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),),
          const SizedBox(height: 20,),
          SizedBox(
            height: size.height * 0.5,
            child:ListView.builder(
              itemCount: feedbackReviews.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  FeedbackModel feedback = feedbackReviews[index];
                  return Card(
                    margin: const EdgeInsets.only(right: 20),
                    color: cardColor,
                    elevation: 1,
                    child: SizedBox(
                      width: size.width*0.5,
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
                }),
          )
          /*Card(
            color: cardColor,
            elevation: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: feedbackReviews.map((feedback){
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person, color: Colors.white,),
                              ),
                              title: Text(feedback.fromClient),
                              subtitle: Text(feedback.platform),
                            ),
                            const SizedBox(height: 10,),
                            Text(feedback.feedbackText),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                Image.asset(icFreelanceExperienceIcon, height: 45,),
                                const SizedBox(width: 10,),
                                Text(feedback.platform, style: subHeadingStyleWeb,),
                              ],
                            ),

                          ],
                        ),
                      ),

                      Divider(),
                    ],
                  );
                }).toList(),
              ),
            ),
          )*/
          /*Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: feedbackReviews.map((feedback) {
                return Padding(
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
                );
              }).toList(),
            ),
          )*/
        ],
      ),
    );
  }
}