import 'package:flutter/material.dart';

var _primaryColor = const Color(0xff1A8DFF);

ThemeData appThemeData = ThemeData(
  primaryColor: _primaryColor,
  primaryColorLight: const Color(0xffE3EEFC),
  primaryColorDark: const Color(0xff042FF8),
  scaffoldBackgroundColor: const Color(0xffe3e3e3),
  colorScheme: ColorScheme(
    primary: _primaryColor,
    secondary: const Color(0xffE51937),
    surface: const Color(0xff737272),
    onPrimary: const Color(0xff718B9A),
    background: const Color(0xffFCFCFC),
    onSurface: const Color(0xff000000),
    error: const Color(0xffE51937),
    onBackground: const Color(0xffE3EAEE),
    onSecondary: const Color(0xff2D404D),
    brightness: Brightness.light,
    onError: const Color(0xffE51937),
  ),
);
