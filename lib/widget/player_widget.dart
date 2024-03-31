import 'package:flutter/material.dart';
import 'package:sportify_application/widget/playerinfo_widget.dart';

Widget players(var _screen, BuildContext context) {
  return InkWell(
    onTap: () {
      showplayerInfoBottomSheet(context);
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: _screen.height * 0.15,
        width: _screen.width * 0.92,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
