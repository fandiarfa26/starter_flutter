import 'package:flutter/material.dart';

const String fontSans = "Rubik";
const String fontSerif = "NotoSerif";
const String fontMono = "SpaceMono";

Color? primaryColor = Colors.amber;
Color? secondaryColor = Colors.lightBlue;
Color? successColor = Colors.green;
Color? dangerColor = Colors.red;

ThemeData appTheme = ThemeData(
  fontFamily: fontSans,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class Typo {
  static const TextStyle _defaultStyle = TextStyle(fontFamily: fontSans);

  static final TextStyle _bold =
      _defaultStyle.copyWith(fontWeight: FontWeight.w700);

  static TextStyle b12p = _bold.copyWith(fontSize: 12);
  static TextStyle b14p = _bold.copyWith(fontSize: 14);
  static TextStyle b18p = _bold.copyWith(fontSize: 18);
  static TextStyle b24p = _bold.copyWith(fontSize: 24);
  static TextStyle b36p = _bold.copyWith(fontSize: 36);
  static TextStyle b64p = _bold.copyWith(fontSize: 64);

  static TextStyle r12p = _defaultStyle.copyWith(fontSize: 12);
  static TextStyle r14p = _defaultStyle.copyWith(fontSize: 14);
  static TextStyle r18p = _defaultStyle.copyWith(fontSize: 18);
}

class Btn {
  static ButtonStyle primary = ElevatedButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 15),
    primary: secondaryColor,
    onPrimary: Colors.white,
    textStyle: Typo.b14p,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
  static ButtonStyle danger = ElevatedButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 15),
    primary: dangerColor,
    onPrimary: Colors.white,
    textStyle: Typo.b14p,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
  static ButtonStyle success = ElevatedButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 15),
    primary: successColor,
    onPrimary: Colors.white,
    textStyle: Typo.b14p,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}
