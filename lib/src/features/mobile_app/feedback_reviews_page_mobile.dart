import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:portfolio/src/provider/portfolio_data_provider.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_provider.dart';
import '../../themes_styles/style_constant.dart';
import '../../themes_styles/theme.dart';

class FeedbackAndReviewsPageMobile extends StatelessWidget{
  const FeedbackAndReviewsPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
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

        return Column(
          children: [
            const Text("Feedback & Reviews", style: headingStyleWeb,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Words of appreciation from those I've had the pleasure to work with",textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),),
            ),
            const SizedBox(height: 20,),
            
            _buildFeedbackContent(portfolioProvider, cardColor),
          ],
        );
      },
    );
  }

  Widget _buildFeedbackContent(PortfolioDataProvider provider, Color cardColor) {
    switch (provider.feedbackState) {
      case LoadingState.loading:
        return const Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      
      case LoadingState.error:
        return Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              children: [
                const Icon(Icons.error_outline, size: 50, color: Colors.red),
                const SizedBox(height: 10),
                const Text(
                  'Failed to load feedback reviews',
                  style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                  textAlign: TextAlign.center,
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
          return const Padding(
            padding: EdgeInsets.all(50.0),
            child: Center(
              child: Text(
                'No feedback reviews found',
                style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return ExpandableCarousel(
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
          items: feedbackList.map((feedback) {
            return Card(
                color: cardColor,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 25),
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
        );
      
      default:
        return const SizedBox.shrink();
    }
  }
}
