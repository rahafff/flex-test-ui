import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_ui/core_modules/module_theme/pressistance/theme_preferences_helper.dart';
import 'package:test_ui/utils/theme_consts.dart';

@injectable
class AppThemeDataService {

  // static MaterialColor get swatchColor {
  //   return AppColors.mainColor;
  // }

  static Color get primaryColor {
    return Colors.lime;
  }

  ThemeData getActiveTheme(BuildContext c) {
    final lightScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      // brightness: Brightness.light,
      // onPrimary: primaryColor
    );
    // return ThemeData(
    //   useMaterial3: true,
    //   // colorScheme: lightScheme,
    //   primaryColor: primaryColor,
    //   scaffoldBackgroundColor: Colors.lime,
    //   fontFamily: 'GEssTwoMedium',
    //
    // );

    return ThemeData(
      colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
      brightness: Brightness.light,
      cardColor: AppColors.cardColor,
      primaryColor: AppColors.primaryColor,
      fontFamily: 'GEssTwoBold',

      textTheme: TextTheme(

        bodyMedium: TextStyle(
          fontFamily: 'GEssTwoBold',
        ),

        bodySmall: TextStyle(
            fontFamily: 'GEssUniqueBold',
        ) ,

        titleMedium: TextStyle(
          fontFamily: 'GEssTwoLight',
        ),
        titleSmall: TextStyle(
          fontFamily: 'GEssUniqueLight',
        ),
      ),




    );
  }
}

class AppColors {
  static Color primaryColor = const Color.fromRGBO( 255, 192, 0,1);

  static Color goldColor = const Color.fromRGBO(255, 215, 0,1);
  static Color bronzeColor = const Color.fromRGBO( 205, 127, 50,1);
  static Color redColor = const Color.fromRGBO( 255, 0, 0,1);

  static Color silverColor = const Color.fromRGBO(245, 245, 245,1);
  static Color silverDarkColor = const Color.fromRGBO( 217, 217, 217,1);
  static Color silverTextColor = const Color.fromRGBO( 136, 136, 136,1);
  static Color silverLightColor = const Color.fromRGBO( 192, 192, 192,1);

  static Color cardColor = const Color.fromRGBO( 255, 242, 204,1);

  static Color blackColor = Color.fromRGBO(0, 0, 0, 1);
  static Color blackShadowColor = Color.fromRGBO(0, 0, 0, 0.08);


  // static MaterialColor mainColor = MaterialColor(_orangePrimaryValue,   <int, Color>{
  //   50: Color(0xFFFFF3E0),
  //   100: Color(0xFFFFE0B2),
  //   200: Color(0xFFFFCC80),
  //   300: Color(0xFFFFB74D),
  //   400: Color(0xFFFFA726),
  //   500: Color(_orangePrimaryValue),
  //   600: Color(0xFFFB8C00),
  //   700: Color(0xFFF57C00),
  //   800: Color(0xFFEF6C00),
  //   900: Color(0xFFE65100),
  // });
  // static   final int _orangePrimaryValue =  0xFFFFBF00;

}

class ThemeConstants {
  static const double defaultRadiusRounded = 4.0;
  static const double mediumRadiusRounded = 10.0;
  static const double highRadiusRounded = 25.0;
}
