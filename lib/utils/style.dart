import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle text_style = GoogleFonts.getFont("Rubik",
    fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400);
TextStyle text_style1 = GoogleFonts.getFont("Rubik",
    fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold);
TextStyle text_style2 = GoogleFonts.getFont("Rubik",
    fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
Widget line = SizedBox(
    height: 1,
    width: 2,
    child: ColoredBox(
      color: Colors.grey,
    ));
