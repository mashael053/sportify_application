import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/global_varible.dart';

Widget searchfield() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: TextFormField(
      controller: player_search,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Colors.black,
      style: GoogleFonts.poppins(fontSize: 15),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 8, left: 20, top: 8),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        hintText: 'Search for a player',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      onEditingComplete: () {
        print(player_search.text);
        // Calling function to search in API
      },
    ),
  );
}
