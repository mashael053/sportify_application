import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/style.dart';

// TODO: delete this
String Image_1 =
    "https://imageio.forbes.com/specials-images/imageserve/5f5be112e7f395dc08ef8e58/Lionel-Messi-celebrating-scoring-a-goal-in-the-2019-20-UEFA-Champions-League/1960x0.jpg?format=jpg&width=1440";
Future<void> shareApp(String playerName, String playerClub) async {
  await FlutterShare.share(
      title: 'Player Info',
      text: "Name of player $playerName\nPlay in $playerClub.");
}

void showplayerInfoBottomSheet(BuildContext context) {
  var _screensize = MediaQuery.of(context).size;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //color: Color.fromARGB(255, 254, 253, 237),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Player Info",
                  style: text_style1,
                ),
                SizedBox(
                  width: _screensize.width * 0.40,
                ),

                /// TODO: Delete this
                // InkWell(
                //   onTap: () {
                //     shareApp("Sarah", "Saudia");
                //   },
                //   child: Container(
                //     child: Icon(
                //       Icons.ios_share,
                //       color: Colors.black,
                //     ),
                //     width: 35,
                //     height: 35,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Color.fromARGB(255, 161, 195, 152),
                //     ),
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            line,
            SizedBox(
              height: 10,
            ),
            Container(
              height: _screensize.height * 0.25,
              width: _screensize.width * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(Image_1),
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Name: [Player's Name] \nNumber: [Player's Number] \nCountry: [Player's Country]\nAge: [Player's Age]",
              style: text_style,
            ),
            SizedBox(
              height: 10,
            ),
            line,
            Text(
              "Stats section",
              style: text_style2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Position: Player Position\n'
              'Yellow Cards: Number of Yellow Cards\n'
              'Red Cards: Number of Red Cards\n'
              'Goals: Number of Goals\n'
              'Assists: Number of Assists',
              style: text_style,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 161, 195, 152)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 183, 183, 183),
                                  width: 0.40),
                              borderRadius: BorderRadius.circular(50.0)))),
                  onPressed: () {
                    shareApp("Sarah", "Saudia");
                  },
                  icon: Icon(
                    Icons.ios_share,
                    color: Colors.black,
                  ),
                  label: Text("")
                  //Text(
                  //   "Share",
                  //   style: GoogleFonts.poppins(
                  //     fontSize: 15,
                  //     color: Colors.black,
                  //   ),
                  ),
            )
          ],
        ),
      );
    },
  );
}
