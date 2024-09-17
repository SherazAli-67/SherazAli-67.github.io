import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/features/widgets/read_more_less_widget.dart';
import 'package:portfolio/src/utils/utils.dart';

import '../../../constants/app_icons.dart';
import '../../../models/projects_model.dart';
import '../../../themes_styles/style_constant.dart';

class ProjectItemWidgetTablet extends StatefulWidget {
  const ProjectItemWidgetTablet({
    super.key,
    required this.project,
    required this.isDarkTheme,
    this.isMobile = false
  });
  final ProjectsModel project;
  final bool isDarkTheme;
  final bool isMobile;
  @override
  State<ProjectItemWidgetTablet> createState() => _ProjectItemWidgetTabletState();
}

class _ProjectItemWidgetTabletState extends State<ProjectItemWidgetTablet> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    Color cardColor =  widget.isDarkTheme  ? Colors.black : Colors.white;
    Color iconColor =  widget.isDarkTheme  ? Colors.white : Colors.black;

    return SizedBox(
      width: double.infinity,
      child: Card(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProjectCover(),
              const SizedBox(width: 10,),
              Text(widget.project.title, style: headingStyleWeb,),
              const SizedBox(height: 5,),

              widget.isMobile ? ExpandableText(widget.project.description, color: iconColor, textStyle:  const TextStyle(fontSize: 16, fontFamily: 'Montserrat'),) : Text(widget.project.description, style: const TextStyle(fontSize: 16, fontFamily: 'Montserrat'),),

              const SizedBox(height: 10,),
              const Text("Tech Stack", style: subHeadingStyleWeb,),
              const SizedBox(height: 10,),
              Wrap(
                children: List.generate(widget.project.techStackList.length, (index){
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10, right: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        border: Border.all(color: primaryColor.withOpacity(0.1))
                    ),
                    child: Text(widget.project.techStackList[index], style: const TextStyle(fontSize: 12, fontFamily: 'Montserrat'),),
                  );
                }),
              ),

              IconButton(onPressed: (){
                if(widget.project.appStore != null){
                  Utils.portfolioLaunchUrl(widget.project.appStore!);
                }else if(widget.project.googlePlay != null){
                  Utils.portfolioLaunchUrl(widget.project.googlePlay!);
                }
              }, icon: SvgPicture.asset(icOpenLink, color: iconColor,))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProjectCover() {
    return widget.isMobile
        ?  ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(widget.project.coverPage, fit: BoxFit.cover,))
        :
    MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Column(
        // alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(widget.project.coverPage, fit: BoxFit.cover,)),
          AnimatedOpacity(
              opacity: isHovered
                  ? 1
                  : 0, // opacity(brightness of color) on hover icon text
              duration: const Duration(milliseconds: 100), // time taken to remove icon name
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if(widget.project.appStore != null)
                      IconButton(onPressed: (){
                        Utils.portfolioLaunchUrl(widget.project.appStore!);
                      }, icon: Image.asset(getItOnAppStore)),

                    if(widget.project.googlePlay != null)
                      IconButton(onPressed: (){
                        Utils.portfolioLaunchUrl(widget.project.googlePlay!);
                      }, icon: Image.asset(getItOnPlayConsole))
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}