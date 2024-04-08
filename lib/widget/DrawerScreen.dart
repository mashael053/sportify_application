import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sportify_application/data/global_variables.dart';
import 'package:sportify_application/screens/login_screen_old.dart';
import 'package:sportify_application/screens/login_screen2.dart';
import 'package:sportify_application/utils/style.dart';

class drawer extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      await GoogleSignIn().signOut();

      print('User signed out from Google');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => loginScreen()),
      ); // Perform additional sign-out logic if needed
    } catch (error) {
      print('Error signing out: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget profile = Text("");
    if (loggedInWithGoogle) {
      profile = Text(
        "$firstName $lastName",
        style: text_style2,
      );
    } else {
      profile = Text(
        "$phoneNumber",
        style: text_style2,
      );
    }
    return SafeArea(
      child: Container(
        width: 250, // Fixed width for the drawer
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
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
                        accountName: profile,
                        accountEmail: null,
                        currentAccountPicture: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/icon-profile.jpg'),
                        ),
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(13.0),
              child: ElevatedButton(
                onPressed: () {
                  _signOut(context);
                },
                child: Text('Log Out', style: text_style1),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  backgroundColor: Color(0xFFA1C398),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
