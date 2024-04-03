import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle text_style1 = GoogleFonts.getFont("Rubik",
    fontSize: 16,
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: FontWeight.bold);
TextStyle text_style2 = GoogleFonts.getFont("Rubik",
    fontSize: 16,
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: FontWeight.normal);
TextStyle text_style3 = GoogleFonts.getFont("Rubik",
    fontSize: 23,
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: FontWeight.bold);

Widget line = SizedBox(
    height: 1,
    width: 2,
    child: ColoredBox(
      color: Colors.grey,
    ));
