import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sportify_application/widget/playerInfo_widget.dart';

import '../utils/style.dart';

Widget players(var _screen, BuildContext context, String imag_url, String name,
    String postion, String player_key, int teamKey) {
  return InkWell(
    onTap: () {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) =>
              playerInfo(player_key: player_key, player_teamKey: teamKey));
    },
    child: Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
        elevation: 2,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: 110,
                height: 110,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  imag_url,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    // Handle the error here
                    print('Image loading error: $exception');
                    // Return a fallback widget
                    return Image.asset('assets/player_icon.png');
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Name: ',
                        style: text_style1,
                      ),
                      TextSpan(text: '$name\n', style: text_style2),
                      TextSpan(
                        text: 'Postion: ',
                        style: text_style1,
                      ),
                      TextSpan(text: '$postion', style: text_style2),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}



// Container(
//         height: _screen.height * 0.15,
//         width: _screen.width * 0.92,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: NetworkImage(imag_url), fit: BoxFit.fill),
//           color: Colors.grey,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text("$name"),
//             SizedBox(
//               width: _screen.width * 0.5,
//             ),
//             Text("$postion")
//           ],
//         ),
//       ),