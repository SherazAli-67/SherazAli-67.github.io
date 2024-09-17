import 'package:flutter/cupertino.dart';

import '../utils/app_dimensions.dart';

class ScrollProvider extends ChangeNotifier {
  final scrollController = ScrollController();

  ScrollController get controller => scrollController;

  scroll(int index, {bool isTablet = false}) {
    if(isTablet){
      double offset = index == 1
          ? 410
          : index == 2
          ? 380
          : index == 3
          ? 400
          : index == 4
          ? 1060 :index == 5
          ? 1061 :index == 6
          ? 1061 :245;
      controller.animateTo(
        AppDimensions.normalize(
          offset * index.toDouble(),
        ),
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }else{
      double offset = index == 1
          ? 400
          : index == 2
          ? 350
          : index == 3
          ? 370
          : index == 4
          ? 690 :index == 5
          ? 710 :index == 6
          ? 710 :245;
      controller.animateTo(
        AppDimensions.normalize(
          offset * index.toDouble(),
        ),
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }

  }

  scrollMobile(int index) {
    double offset = index == 1
        ? 290
        : index == 2
        ? 360
        : index == 3
        ? 300
        : 310;
    controller.animateTo(
      AppDimensions.normalize(
        offset * index.toDouble(),
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}