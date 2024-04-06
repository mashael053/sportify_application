import 'package:flutter/material.dart';
import 'package:sportify_application/data/global_variables.dart';
import 'package:sportify_application/screens/login_screen.dart';

Widget drawer(BuildContext context) {
  print(phoneNumber);
  return Container(
    color: Colors.white, // Set the background color to white
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: const Text(
                      'UserName',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black, // Set the text color to white
                      ),
                    ),
                    accountEmail: null,
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/icon-profile.jpg'), // Fix typo in asset path
                    ),
                    decoration: BoxDecoration(),
                  ),
                  if (loggedInWithGoogle)
                    ListTile(title: Text("$firstName $lastName"), onTap: () {})
                  else
                    ListTile(title: Text("$phoneNumber"), onTap: () {}),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(13.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA1C398),
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: SizedBox(
              height: 30,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
        ),
      ],
    ),
  );
}
