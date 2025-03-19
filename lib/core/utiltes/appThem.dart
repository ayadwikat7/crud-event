import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/ColorsApp/ColorsApp.dart';

class ThemApp{
  static final ThemeData lightMode=ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.blackColor
    ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.primaryLight,
    selectedItemColor: AppColors.blackColor,
    unselectedItemColor: AppColors.whiteColor
   ),
   
   floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryLight,
    foregroundColor: AppColors.whiteColor,
    shape: StadiumBorder(
       side: BorderSide(
        color: AppColors.whiteColor,
        width: 6
       )
    )
   )
  );
  static final ThemeData darkMode=ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
       foregroundColor: AppColors.whiteColor
    ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.primaryDark,
    selectedItemColor: AppColors.primaryLight,
    unselectedItemColor: AppColors.whiteColor
   ),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryDark,
    foregroundColor: AppColors.whiteColor
   )
  );
}