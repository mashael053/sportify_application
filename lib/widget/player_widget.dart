import 'package:flutter/material.dart';
import 'package:sportify_application/widget/playerInfo_widget.dart';

Widget players(var _screen, BuildContext context) {
  return InkWell(
    onTap: () {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) =>
              //showplayerInfoBottomSheet(context);
              BottomSheetContent());
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
