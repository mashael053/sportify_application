import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sportify_application/screens/homePage.dart';
import '../data/global_variables.dart';
import 'package:country_code_picker/country_code_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class loglog extends StatefulWidget {
  const loglog({Key? key}) : super(key: key);

  @override
  State<loglog> createState() => _loglogScreenState();
}

class _loglogScreenState extends State<loglog> {
  TextEditingController phoneNumberController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  TextEditingController otpController = TextEditingController();
  String generatedOTP = '';
  String _selectedCountryCode = '+966';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // Handle sign-out errors
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) * 1 / 9,
                  ),
                  Image.asset(
                    'assets/sportifyLogo.png',
                    height: 180,
                    width: 170,
                  ),
                  Center(
                    child: Text(
                      "Get fit with Sportify!",
                      style: GoogleFonts.rubik(
                          fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CountryCodePicker(
                          onChanged: (CountryCode countryCode) {
                            setState(() {
                              _selectedCountryCode = countryCode.toString();
                            });
                          },
                          initialSelection:
                              'SA', // Initial selection (e.g., 'SA' for Saudi Arabia)
                          favorite: [
                            '+966'
                          ], // Optional: Specify favorite country codes
                          showFlagDialog: true,
                          padding: EdgeInsets.zero,
                          textStyle:
                              TextStyle(fontSize: 18, color: Colors.black),
                          barrierColor: Colors.white,
                          boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: Colors.black,
                                width:
                                    1), // Optional: Show flag dialog for country selection
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                backgroundColor:
                                    Color.fromARGB(251, 251, 251, 251),
                              ),
                            ),
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Generate and show OTP
                              setState(() {
                                generatedOTP = generateOTP();
                              });
                              showDialog(
                                context: context,
                                builder: (context) => Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: AlertDialog(
                                      title: Text(
                                        'OTP',
                                        style: TextStyle(
                                            color: Color(0xFFFA7070),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Center(
                                        child: Text(
                                          generatedOTP,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Text('OTP',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              backgroundColor: Color(0xFFA1C398),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: otpController,
                            decoration: InputDecoration(
                              labelText: 'Enter OTP',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  backgroundColor:
                                      Color.fromARGB(251, 251, 251, 251)),
                            ),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        verifyOTP();
                      },
                      child: Text('Verify',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        backgroundColor: Color(0xFFA1C398),
                      ),
                    ),
                  ),
                  SizedBox(height: (MediaQuery.of(context).size.height) * 0.05),
                  Text(
                    'Or',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Divider(
                    color: Colors.grey,
                    indent: 30,
                    endIndent: 30,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () //_signInWithGoogle,
                          async {
                        _handleGoogleSignIn();

                        if (_user != null) {
                          print(
                              "THis is the name ${_user!.providerData[0].displayName}");
                          print(_user!.displayName);
                          loggedInWithGoogle = true;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homepage(
                                  firstName_user: _user!.displayName,
                                  lastName_user: _user!.displayName,
                                  phoneNumber_user: ""),
                            ),
                          );
                        }
                      },
                      child: Text('Login with Google',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  String generateOTP() {
    Random random = Random();
    return (1000 + random.nextInt(9000)).toString();
  }

  // Method to handle OTP verification
  void verifyOTP() {
    print(
        "input value ${otpController.text} what the function generate $generatedOTP");
    if (otpController.text == generatedOTP) {
      // Navigate to home screen if OTP is correct
      print("input ${phoneNumberController.text}, text $phoneNumber ??");
      phoneNumber = phoneNumberController.text;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(
              firstName_user: "",
              lastName_user: "",
              phoneNumber_user: phoneNumber),
        ),
      );
      print('OTP Verified. Navigate to Home Screen');
    } else {
      // Show error message if OTP is incorrect
      showDialog(
        context: context,
        builder: (context) => Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
            child: AlertDialog(
              title: Text(
                'Error',
                style: TextStyle(
                    color: Color(0xFFFA7070), fontWeight: FontWeight.bold),
              ),
              content: Center(
                  child: Text(
                'Incorrect OTP. Please try again.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }
}
  // Future<void> _signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await _googleSignIn.signIn();
  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );
  //       final UserCredential userCredential =
  //           await _auth.signInWithCredential(credential);
  //       final User? user = userCredential.user;

  //       if (user != null) {
  //         // Navigate to the home page
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Homepage(),
  //           ),
  //         );
  //       }
  //     }
  //   } catch (error) {
  //     print('Error signing in with Google: $error');
  //   }
  // }

