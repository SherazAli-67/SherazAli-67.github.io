import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatefulWidget {
  final String icon;
  final Color color;
  final String text;
  const SocialIcon({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      margin: const EdgeInsets.only(right: 2),
      height: 105,
      width: 85,
      child: Stack(
        children: [
          // for display the icn name after hover on icon
          AnimatedOpacity(
            opacity: isHover
                ? 1
                : 0, // opacity(brightness of color) on hover icon text
            duration: const Duration(
                milliseconds: 100), // time taken to remove icon name
            child: AnimatedAlign(
              alignment: isHover
                  ? const Alignment(0, -1)
                  : const Alignment(
                  0, 0), // in which durection icon name should be display
              duration: const Duration(milliseconds: 200),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // arrow to show icon name
                  Positioned(
                    left: 70,
                    top: 30,
                    child: Transform(
                      transform: Matrix4.rotationZ(pi / 4),
                      alignment: FractionalOffset.center,
                      child: Container(
                        height: 10,
                        width: 10,
                        color: widget.color,
                      ),
                    ),
                  ),
                  // for icon name
                  Container(
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.color,
                    ),
                    child: Center(
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // for social icon
          Align(
            alignment: Alignment.bottomCenter,
            // now we make it=> change the color during hover on icon
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHover = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHover = false;
                });
              },
              child: AnimatedContainer(
                height: 60,
                width: 60,
                duration: const Duration(milliseconds: 350),
                /*decoration: BoxDecoration(
                  color: isHover ? widget.color : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),*/
                child: SvgPicture.asset(
                  widget.icon,
                  // color: isHover ? Colors.white : widget.color,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}