import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


ThemeData lightTheme =ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.deepPurple
);
ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.deepOrange
);
class ThemeManager with ChangeNotifier{
  ThemeMode _themeMode= ThemeMode.light;
  ThemeMode get themeMode => themeMode;

   toggleThemeMode(bool isDark)
  {
    _themeMode=isDark?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }


}