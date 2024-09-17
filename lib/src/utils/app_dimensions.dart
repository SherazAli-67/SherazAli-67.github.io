import 'package:flutter/material.dart';


import 'dart:math';
import 'package:flutter/widgets.dart';
class AppDimensions {
  static double? maxContainerWidth;
  static double? miniContainerWidth;

  static bool? isLandscape;
  static double? padding;
  static double ratio = 0;

  static Size? size;

  static init() {
    ratio = UI.width! / UI.height!;
    double pixelDensity = UI.mediaQuery().devicePixelRatio;
    ratio = (ratio) + ((pixelDensity + ratio) / 2);

    if (UI.width! <= 380 && pixelDensity >= 3) {
      ratio *= 0.85;
    }

    _initLargeScreens();
    _initSmallScreensHighDensity();

    padding = ratio * 3;
  }

  static _initLargeScreens() {
    const safe = 2.4;

    ratio *= 1.5;

    if (ratio > safe) {
      ratio = safe;
    }
  }

  static _initSmallScreensHighDensity() {
    if (!UI.sm! && ratio > 2.0) {
      ratio = 2.0;
    }
    if (!UI.xs! && ratio > 1.6) {
      ratio = 1.6;
    }
    if (!UI.xxs! && ratio > 1.4) {
      ratio = 1.4;
    }
  }

  static double space([double multiplier = 1.0]) {
    return AppDimensions.padding! * 3 * multiplier;
  }

  static double normalize(double unit) {
    return (AppDimensions.ratio * unit * 0.77) + unit;
  }

  static double font(double unit) {
    return (AppDimensions.ratio * unit * 0.125) + unit * 1.90;
  }
}

class UI {
  static MediaQueryData? _mediaQueryData;
  static double? width;
  static double? height;
  static double? horizontal;
  static double? vertical;
  static EdgeInsets? padding;
  static EdgeInsets? vi;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeWidth;
  static double? safeHeight;

  static double? diagonal;

  static bool? xxs;
  static bool? xs;
  static bool? sm;
  static bool? md;
  static bool? xmd;
  static bool? lg;
  static bool? xl;
  static bool? xlg;
  static bool? xxlg;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    initChecks(_mediaQueryData!);

    padding = _mediaQueryData!.padding;
    vi = _mediaQueryData!.viewInsets;
    width = _mediaQueryData!.size.width;
    height = _mediaQueryData!.size.height;
    horizontal = width! / 100;
    vertical = height! / 100;

    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeWidth = (width! - _safeAreaHorizontal!);
    safeHeight = (height! - _safeAreaVertical!);
  }

  static initChecks(MediaQueryData query) {
    var size = query.size;
    diagonal = sqrt((size.width * size.width) + (size.height * size.height));
    xxs = size.width > 300;
    xs = size.width > 360;
    sm = size.width > 480;
    md = size.width > 600;
    xmd = size.width > 720;
    lg = size.width > 980;
    xl = size.width > 1160;
    xlg = size.width > 1400;
    xxlg = size.width > 1700;
  }

  static MediaQueryData mediaQuery() => _mediaQueryData!;

  static Size getSize() => _mediaQueryData!.size;
}