import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/app_icons.dart';
import 'package:portfolio/src/constants/size_constants.dart';
import 'package:portfolio/src/models/feedback_model.dart';
import 'package:portfolio/src/provider/portfolio_data_provider.dart';
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
    
    return Consumer<PortfolioDataProvider>(
      builder: (context, portfolioProvider, child) {
        // Initialize data loading if not started
        if (portfolioProvider.feedbackState == LoadingState.idle) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            portfolioProvider.loadFeedbackReviews();
          });
        }

        return Center(
          child: Column(
            children: [
              const Text("Feedback & Reviews", style: headingStyleWeb,),
              const Text("Words of appreciation from those I've had the pleasure to work with", style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),),
              const SizedBox(height: 20,),
              
              _buildFeedbackContent(portfolioProvider, cardColor, size),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeedbackContent(PortfolioDataProvider provider, Color cardColor, Size size) {
    switch (provider.feedbackState) {
      case LoadingState.loading:
        return SizedBox(
          height: size.height * 0.5,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );

      case LoadingState.error:
        return SizedBox(
          height: size.height * 0.5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 50, color: Colors.red),
                const SizedBox(height: 10),
                const Text(
                  'Failed to load feedback reviews',
                  style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => provider.loadFeedbackReviews(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );

      case LoadingState.success:
        final feedbackList = provider.feedbackReviews;
        if (feedbackList.isEmpty) {
          return SizedBox(
            height: size.height * 0.5,
            child: const Center(
              child: Text(
                'No feedback reviews found',
                style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
              ),
            ),
          );
        }
        return SizedBox(
          height: size.height * 0.5,
          child: ListView.builder(
              itemCount: feedbackList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                FeedbackModel feedback = feedbackList[index];
                return Card(
                  margin: const EdgeInsets.only(right: 20),
                  color: cardColor,
                  elevation: 1,
                  child: SizedBox(
                    width: size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 25),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: feedback.profileUrl.isNotEmpty ? CachedNetworkImage(imageUrl: feedback.profileUrl)  : Icon(Icons.person, color: Colors.white,),
                          ),
                          const SizedBox(height: 20,),

                          Text(
                            feedback.feedbackText, textAlign: TextAlign.center,
                            style: regularTextStyleWeb.copyWith(
                                fontFamily: 'Montserrat'),),
                          const Spacer(),
                          Text(feedback.fromClient,
                            style: subHeadingStyleWeb.copyWith(
                                fontFamily: 'Montserrat'),),

                          Text(feedback.platform),
                          const SizedBox(height: 10,)
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      default:
        return const SizedBox();
    }
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
          )
        ],
      ),
    );

           */
  }
}
