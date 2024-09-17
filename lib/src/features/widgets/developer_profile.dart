import 'dart:io';
import 'package:flutter/material.dart';

import '../../themes_styles/style_constant.dart';

class DeveloperProfile extends StatefulWidget {
  const DeveloperProfile({
    super.key,
    required this.profileUrl,
    required this.size,
    this.isLocalImage = false
  });

  final String profileUrl;
  final double size;
  final bool isLocalImage;
  @override
  State<DeveloperProfile> createState() => _DeveloperProfileState();
}

class _DeveloperProfileState extends State<DeveloperProfile> {
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: widget.isLocalImage ? Image.file(
          File(widget.profileUrl),
          width: widget.size,
          height: widget.size,
          fit: BoxFit.cover, // This ensures the image fits inside the circle.
        ):


        Image.asset(
          widget.profileUrl,
          height: widget.size,
          errorBuilder: (ctx, obj, stackTrace)=> CircleAvatar(
            radius: widget.size,
            backgroundColor: primaryColor.withOpacity(0.2),
          ),
        ),
      ));
  }
}