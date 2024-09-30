// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:movies_app/core/resources/app_colors.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(

//     // main colors
//     scaffoldBackgroundColor: AppColors.primaryBackground,

//     // Bottom nav bar theme
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: AppColors.secondaryBackground,
//       selectedItemColor: AppColors.primary,
//       unselectedItemColor: AppColors.primaryText,
//       type: BottomNavigationBarType.fixed,
//     ),

//     // app bar theme
//     appBarTheme: AppBarTheme(
//       backgroundColor: AppColors.primaryBackground,
//       elevation: 0,
//       centerTitle: true,
//       systemOverlayStyle: SystemUiOverlayStyle.light,
//       titleTextStyle: _getTextStyle(
//         fontSize: 18,
//         color: AppColors.secondaryText,
//       ),
//     ),

//     // text theme
//     textTheme: TextTheme(
      
//       titleMedium: _getTextStyle(
//         fontSize: 20,
//         color: AppColors.secondaryText,
//       ),
//       titleSmall: _getTextStyle(
//         fontSize: 18,
//         color: AppColors.secondaryText,
//       ),
//       bodyLarge: _getTextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         color: AppColors.primaryText,
//       ),
//       bodyMedium: _getTextStyle(
//         fontSize: 14,
//         color: AppColors.secondaryText,
//       ),
//       bodySmall: _getTextStyle(
//         fontSize: 12,
//         fontWeight: FontWeight.w400,
//         color: AppColors.primaryText,
//       ),
//     ),
//   );
// }

// TextStyle _getTextStyle({
//   required double fontSize,
//   FontWeight fontWeight = FontWeight.w600,
//   required Color color,
// }) {
//   return GoogleFonts.poppins(
//     fontSize: fontSize,
//     fontWeight: fontWeight,
//     color: color,
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/resources/app_colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData(

    // main colors
    scaffoldBackgroundColor: AppColors.primaryBackground,

    // Bottom nav bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondaryBackground,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.primaryText,
      type: BottomNavigationBarType.fixed,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryBackground,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: _getArabicTextStyle(
        fontSize: 18,
        color: AppColors.secondaryText,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      titleMedium: _getArabicTextStyle(
        fontSize: 20,
        color: AppColors.secondaryText,
      ),
      titleSmall: _getArabicTextStyle(
        fontSize: 18,
        color: AppColors.secondaryText,
      ),
      bodyLarge: _getArabicTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryText,
      ),
      bodyMedium: _getArabicTextStyle(
        fontSize: 14,
        color: AppColors.secondaryText,
      ),
      bodySmall: _getArabicTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryText,
      ),
    ),
  );
}

TextStyle _getArabicTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w600,
  required Color color,
}) {
  return GoogleFonts.tajawal( 
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
