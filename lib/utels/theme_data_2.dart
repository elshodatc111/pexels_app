import 'package:flutter/material.dart';

class ThemeData2 {
  String fontFamily;
  TextTheme textTheme;

  ThemeData2({required this.fontFamily, required this.textTheme});

  static ThemeData self() {
    var themData = ThemeData(
      fontFamily: 'Montserrat',
      textTheme: const TextTheme(),
      scaffoldBackgroundColor: Colors.grey.shade100,
    );
    return themData;
  }
}
