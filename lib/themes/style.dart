import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = const Color(0xFF022c43);
const secondColor = const Color(0xFF053f5e);
const thirdColor = const Color(0xFF115173);
const borderColor = const Color(0xFFD8ECF6);
const accentColor = const Color(0xFF87FFF1);

ThemeData theme() {
  return ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      canvasColor: secondColor,
      secondaryHeaderColor: thirdColor,
      accentColor: accentColor,
      cardColor: borderColor,
      fontFamily: 'Montserrat'
      );
}
