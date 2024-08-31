import 'package:flutter/material.dart';
import 'package:portfolio/src/themes_styles/theme.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = darkTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightTheme){
      _themeData = darkTheme;
    }else{
      _themeData = lightTheme;
    }

    notifyListeners();
  }
}