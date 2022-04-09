import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  //Colors
  static Color? primaryColor = const Color.fromARGB(255, 2, 0, 91);
  static Color? colorGrey2 = const Color.fromARGB(255, 79, 79, 79);
  static Color? colorGrey3 = const Color.fromARGB(255, 130, 130, 130);
  static Color? colorGrey4 = const Color.fromARGB(255, 189, 189, 189);
  static Color? colorYellow = const Color.fromARGB(255, 255, 203, 5);
  static Color? backgroundColor = const Color.fromARGB(255, 253, 26, 87);
  static Color? shadowColor = const Color.fromARGB(65, 0, 0, 0);
  static Color colorRed1 = const Color.fromARGB(255, 253, 26, 85);

  //Fonts
  static TextStyle fontOpenSans(TextStyle style) =>
      GoogleFonts.openSans(textStyle: style);

  //TextStyles
  static TextStyle textStyle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Constants.colorRed1,
  );
}
