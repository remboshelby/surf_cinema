import 'package:flutter/material.dart';
import 'package:surf_cinema/layers/ui/colors.dart';

class AppThemes {
  static ThemeData materialAppTheme() => ThemeData(
    backgroundColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.primary,
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primary,
    accentColor: AppColors.primary,
    textSelectionHandleColor: AppColors.primary,
    textSelectionColor: AppColors.primary,
    unselectedWidgetColor: AppColors.primary,
    disabledColor: AppColors.primary.withOpacity(0.2),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
    ),
  );
}
