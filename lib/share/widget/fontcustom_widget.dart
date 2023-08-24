import 'package:flutter/material.dart';

TextStyle customFontBassac(double fontSize, Color color) =>
    TextStyle(fontFamily: 'KhmerOSBassac', fontSize: fontSize, color: color);

TextStyle customFontBTB(double fontSize, Color color) => TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'KhmerOSBTB',
    fontSize: fontSize,
    color: color);

TextStyle customFontKoulen(double fontSize, Color color) =>
    TextStyle(fontFamily: 'KhmerOSKoulen', fontSize: fontSize, color: color);

TextStyle customFontKangrey(double fontSize, Color color) =>
    TextStyle(fontFamily: 'KhmerOSKangrey', fontSize: fontSize, color: color);

TextStyle customFontSR(double fontSize, Color color) =>
    TextStyle(fontFamily: 'KhmerOSSiemreap', fontSize: fontSize, color: color);

InputDecoration textFieldStyle(Size size) {
  return InputDecoration(
    isDense: true,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 61, 200, 36), width: 2)),
    enabledBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Color.fromARGB(255, 33, 40, 61), width: 2),
        borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.symmetric(
        horizontal: size.width * 0.01, vertical: size.height * 0.012),
  );
}
