import 'package:flutter/material.dart';

ThemeData get appTheme => ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xffffffff),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        foregroundColor: Color(0xff0f0f0f),
        backgroundColor: Colors.transparent,
        elevation: 0),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(elevation: 0.0));
