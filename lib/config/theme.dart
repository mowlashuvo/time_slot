import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../animation/no_animation.dart';

ThemeData theme() {
  final builder = NoAnimationPageTransitionBuilder();
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: 'Inter',
    textTheme: textTheme(),
    buttonColor: const Color.fromRGBO(255, 176, 153, 1),
    primaryColor: const Color.fromRGBO(241, 82, 35, 1),
    splashColor: const Color.fromRGBO(255, 176, 153, 1),
    primaryColorLight: const Color.fromRGBO(255, 176, 153, 1),
    accentColor: const Color.fromRGBO(241, 82, 35, 1),
    bottomAppBarColor: const Color.fromRGBO(241, 82, 35, 1),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: builder,
        TargetPlatform.fuchsia: builder,
        TargetPlatform.iOS: builder,
        TargetPlatform.linux: builder,
        TargetPlatform.macOS: builder,
        TargetPlatform.windows: builder,
      },
    ),
  );
}

TextTheme textTheme() {
  Colors.transparent;
  return TextTheme(
      // headline1: TextStyle(
      //   color: Colors.black,
      //   fontSize: 15.sp,
      //   fontWeight: FontWeight.bold
      // ),
      // headline2: TextStyle(
      //   color: Colors.black,
      //   fontSize: 15.sp,
      //   fontWeight: FontWeight.bold
      // ),
      // headline3: TextStyle(
      //   color: Colors.black,
      //   fontSize: 15.sp,
      //   fontWeight: FontWeight.bold
      // ),
      // headline4: TextStyle(
      //   color: Colors.black,
      //   fontSize: 15.sp,
      //   fontWeight: FontWeight.bold
      // ),
      // headline5: TextStyle(
      //   color: Color(0xff682976),
      //   fontSize: 18.sp,
      //   fontWeight: FontWeight.w700,
      // ),
      // headline6: TextStyle(
      //   color: const Color(0xff272727),
      //   fontSize: 12.sp,
      //   fontWeight: FontWeight.w700,
      // ),
      // bodyText1: TextStyle(
      //   color: Colors.black,
      //   fontSize: 12.sp,
      //   fontWeight: FontWeight.normal
      // ),
      // bodyText2: TextStyle(
      //   color: Colors.black,
      //   fontSize: 10.sp,
      //   fontWeight: FontWeight.normal
      // ),
      bodyLarge: GoogleFonts.dmSans(
        // textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 16.sp,
        color: const Color.fromRGBO(37, 37, 37, 0.6),
        letterSpacing: 0.4,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.dmSans(
        // textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 12.sp,
        color: const Color.fromRGBO(255, 255, 255, 1),
        letterSpacing: 0.4,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: GoogleFonts.dmSans(
        // textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 12.sp,
        color: const Color.fromRGBO(37, 37, 37, 0.6),
        letterSpacing: 0.4,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: GoogleFonts.dmSans(
        // textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 18.sp,
        color: const Color.fromRGBO(37, 37, 37, 0.6),
        letterSpacing: 0.4,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.dmSans(
        // textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 12.sp,
        color: const Color.fromRGBO(37, 37, 37, 0.6),
        letterSpacing: 0.4,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: GoogleFonts.dmSans(
        // textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 12.sp,
        color: const Color.fromRGBO(37, 37, 37, 0.6),
        letterSpacing: 0.4,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: GoogleFonts.dmSans(
        // textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 16.sp,
        color: const Color.fromRGBO(0, 0, 0, 1),
        letterSpacing: 0.4,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: GoogleFonts.dmSans(
        // textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 12.sp,
        color: const Color.fromRGBO(39, 39, 39, 1),
        letterSpacing: 0.4,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: GoogleFonts.dmSans(
        // textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 12.sp,
        color: const Color.fromRGBO(39, 39, 39, 1),
        letterSpacing: 0.4,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: GoogleFonts.dmSans(
        // textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 14.sp,
        color: const Color.fromRGBO(37, 37, 37, 0.6),
        letterSpacing: 0.4,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
      ));
}
