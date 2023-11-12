import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  String currentLocal="en";
  ThemeMode currentTheme= ThemeMode.light;
  changeTheme(ThemeMode newTheme){
    if(currentTheme==newTheme) return;
    currentTheme=newTheme;
    notifyListeners();
  }
  changeLanguage(String newLanguage){
    if(currentLocal == newLanguage) return;
    currentLocal=newLanguage;
    notifyListeners();
  }
  bool isDark(){
    return currentTheme==ThemeMode.dark;
  }
  String backGroundImage(){
    return isDark()? "assets/images/pattern.png" : "assets/images/pattern.png";
  }
  String splashScreenImage(){
    return isDark()? "assets/images/pattern.png": "assets/images/pattern.png";
  }
}