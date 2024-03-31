import 'package:flutter/material.dart';

Widget players(var _screen) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      height: _screen.height * 0.15,
      width: _screen.width * 0.92,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
