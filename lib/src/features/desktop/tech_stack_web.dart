import 'package:flutter/cupertino.dart';

import '../../data/portfolio_data.dart';
import '../../models/tech_stack_model.dart';
import '../../themes_styles/style_constant.dart';
import 'widgets/tech_stack_web_item_widget.dart';

class TechStackWeb extends StatelessWidget{
  const TechStackWeb({super.key});

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       const Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text("My Tech Stack", style: headingStyleWeb,),
             Text("Technologies I’ve been working with recently", style: TextStyle(fontSize: 19, fontFamily: 'Montserrat'),)
           ],
         ),
       ),
       const SizedBox(height: 20,),
       SizedBox(
         height: 300,
         child: GridView.builder(
             itemCount: PortfolioData.techStackList.length,
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 3/1.5),
             itemBuilder: (ctx, index) {
               TechStackModel techStack = PortfolioData.techStackList[index];
               return TechStackWebItemWidget(techStack: techStack,);
             }),
       ),
     ],
   );
  }

}