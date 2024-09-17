import 'package:flutter/cupertino.dart';

import '../../data/portfolio_data.dart';
import '../../models/tech_stack_model.dart';
import '../../themes_styles/style_constant.dart';
import '../desktop/widgets/tech_stack_web_item_widget.dart';

class TechStackMobile extends StatelessWidget{
  const TechStackMobile({super.key, required this.childAspectRatio});
  final double childAspectRatio;
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       const Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text("My Tech Stack", style: subHeadingStyleWeb,),
             Text("Technologies I’ve been working with recently", textAlign: TextAlign.center,style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),)
           ],
         ),
       ),
       const SizedBox(height: 20,),
       SizedBox(
         height: 500,
         child: GridView.builder(
           physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
             itemCount: PortfolioData.techStackList.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: childAspectRatio),
              itemBuilder: (ctx, index) {
               TechStackModel techStack = PortfolioData.techStackList[index];
               return TechStackWebItemWidget(techStack: techStack,);
             }),
       ),
     ],
   );
  }

}