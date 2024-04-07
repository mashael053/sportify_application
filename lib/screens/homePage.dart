import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sportify_application/screens/countries_screen.dart';
import 'package:sportify_application/data/global_variables.dart';
import 'package:sportify_application/utils/style.dart';
import 'package:sportify_application/widget/DrawerScreen.dart';

class Homepage extends StatelessWidget {
  String? firstName_user;
  String? lastName_user;
  String? phoneNumber_user;
  Homepage({
    Key? key,
    this.firstName_user,
    this.lastName_user,
    this.phoneNumber_user,
  });

  @override
  Widget build(BuildContext context) {
    firstName = firstName_user;
    lastName = lastName_user;
    phoneNumber = phoneNumber_user;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            'Sportify',
            style: TextStyle(color: Colors.black, fontFamily: "SportsWorld"),
          ),
          backgroundColor: Color(0xFFA1C398), // Set AppBar color to A1C398
          centerTitle: true,
        ),
        drawer: Drawer(
          child: drawer(context),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Sports lovers, this is for you! Discover football, basketball, cricket, and tennis.',
                style: GoogleFonts.getFont("Rubik",
                    fontSize: 20,
                    color: Color.fromARGB(255, 2, 2, 2),
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListPlay(
                      Color.fromARGB(66, 198, 235, 197),
                      "assets/footballHomepage.png",
                      "Football",
                      () {
                        // Add the code to navigate to the country page here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountriesScreen()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ListPlay(
                      Color.fromARGB(66, 198, 235, 197),
                      "assets/basketballHomepage.png",
                      "Basketball",
                      () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Coming Soon',
                                style: TextStyle(
                                    color: Color(0xFFFA7070),
                                    fontWeight: FontWeight.bold),
                              ),
                              content: Text(
                                'Basketball is coming soon!',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 251, 251),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: ListPlay(
                      Color.fromARGB(66, 198, 235, 197),
                      "assets/cricetHomepage.png",
                      "Cricket",
                      () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Coming Soon',
                                style: TextStyle(
                                    color: Color(0xFFFA7070),
                                    fontWeight: FontWeight.bold),
                              ),
                              content: Text(
                                'Cricket is coming soon!',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 251, 251),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ListPlay(
                      Color.fromARGB(66, 198, 235, 197),
                      "assets/tennisHomepage.png",
                      "Tennis",
                      () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Coming Soon',
                                style: TextStyle(
                                    color: Color(0xFFFA7070),
                                    fontWeight: FontWeight.bold),
                              ),
                              content: Text(
                                'Tennis is coming soon!',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 251, 251),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListPlay extends StatelessWidget {
  final Color playColor;
  final String imagePath;
  final String playName;
  final Function() onTap;

  const ListPlay(this.playColor, this.imagePath, this.playName, this.onTap,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Container(
          height: 170,
          //width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: playColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              Image.asset(
                imagePath,
                height: 120,
                width: 140,
              ),
              Text(
                playName,
                style: GoogleFonts.getFont("Rubik",
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
