
import 'package:flutter/material.dart';

class ThemeDataConfig {
  static const String fontFamily = "IranYekan";

  final Color primaryColor = const Color.fromARGB(255, 241, 226, 226);
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Color drawerBackgroundColor;
  final Brightness brightness;

  ThemeDataConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = const Color(0x0dffffff),
        appBarColor = Colors.black,
        drawerBackgroundColor = const Color.fromARGB(255, 30, 30, 30),
        brightness = Brightness.dark,
        backgroundColor = const Color.fromARGB(255, 0, 0, 0);

  ThemeDataConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = const Color(0x0d000000),
        appBarColor = const Color.fromARGB(255, 255, 255, 255),
        backgroundColor = const Color.fromARGB(255, 231, 234, 241),
        drawerBackgroundColor = const Color.fromARGB(255, 241, 226, 226),
        brightness = Brightness.light;

  ThemeData getThemeData() {
    return ThemeData(
      canvasColor: drawerBackgroundColor,
      primaryColor: primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
      dividerColor: surfaceColor,
      dividerTheme: const DividerThemeData(),
      brightness: brightness,
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(
          fontWeight: FontWeight.w900,
          color: secondaryTextColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarColor,
        foregroundColor: primaryTextColor,
        elevation: 0,
      ),
      textTheme: textTheme,
      dialogTheme: DialogThemeData(
        titleTextStyle: TextStyle(
          // Set the title color based on the theme brightness
          color: brightness == Brightness.dark
              ? const Color(0xFF616161)
              : const Color(0xFFECC9C7),
          // Other text style properties
        ),
        backgroundColor: brightness == Brightness.dark
            ? const Color(0xFF424242)
            : const Color(0xFFFFFFFF),
        // Other dialog theme properties
      ),
    );
  }

  TextTheme get textTheme => TextTheme(
        bodyLarge: TextStyle(
          fontSize: 15,
          color: primaryTextColor,
          fontFamily: fontFamily,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          height: 1.5,
          color: secondaryTextColor,
          fontFamily: fontFamily,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: primaryTextColor,
          fontFamily: fontFamily,
        ),
        bodySmall: const TextStyle(fontFamily: fontFamily),
        labelLarge: const TextStyle(fontFamily: fontFamily),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w900,
          color: secondaryTextColor,
        ),
      );
}
