import 'package:flutter/material.dart';

Widget drawer() {
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
                          'assest/icon-profile.jpg'), // Fix typo in asset path
                    ),
                    decoration: BoxDecoration(),
                  ),
                  ListTile(
                    title: const Text('Mashael Ali'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
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
              child: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
