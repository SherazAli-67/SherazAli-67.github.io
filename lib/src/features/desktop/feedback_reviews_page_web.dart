import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:portfolio/src/data/feedback_reviews.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../themes_styles/style_constant.dart';
import '../../themes_styles/theme.dart';
class FeedbackAndReviewsPageWeb extends StatelessWidget{
  const FeedbackAndReviewsPageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<ThemeProvider>(context).themeData == darkTheme;
    Color cardColor = isDarkTheme ? Colors.black : Colors.white;
    return Column(
      children: [
        const Text("Feedback & Reviews", style: headingStyleWeb,),
        const Text("Words of appreciation from those I’ve had the pleasure to work with", style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),),
        const SizedBox(height: 20,),

        ExpandableCarousel(
          options: ExpandableCarouselOptions(
            autoPlay: true,
            showIndicator: false,
            autoPlayInterval: const Duration(seconds: 5),
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
            items: feedbackReviews.map((feedback) {
              return Card(
                  color: cardColor,
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  feedback.fromClient,
                                  style: subHeadingStyleWeb.copyWith(
                                      fontFamily: 'Montserrat'),
                                ),
                                const RatingBar.readOnly(
                                  filledIcon: Icons.star,
                                  emptyIcon: Icons.star_border,
                                  initialRating: 5,
                                  maxRating: 5,
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          feedback.feedbackText,
                          textAlign: TextAlign.start,
                          style: regularTextStyleWeb.copyWith(
                              fontFamily: 'Montserrat', fontSize: 15),
                        ),
                      ],
                    ),
                  ));
            }).toList(),
        ),
      ],
    );
  }
}