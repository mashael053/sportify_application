import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String generatedOTP = '';
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * 1 / 9,
                ),
                Image.asset(
                  'assets/sportifyLogo.png',
                  height: 190,
                  width: 180,
                ),
                Center(
                  child: Text(
                    "Get fit with Sportify!",
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 187, 157, 157)),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      labelStyle: TextStyle(
                          fontSize: 14,
                          backgroundColor: Color.fromARGB(251, 251, 251, 251)),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
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
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: AlertDialog(
                                    title: Center(child: Text('OTP')),
                                    content: Center(
                                      child: Text(generatedOTP,
                                          textAlign: TextAlign.center),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Text('OTP',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
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
                    onPressed: verifyOTP,
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
                SizedBox(height: (MediaQuery.of(context).size.height) * 0.07),
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
                    onPressed: () async {
                      final GoogleSignInAccount? googleUser =
                          await _googleSignIn.signIn();
                      if (googleUser != null) {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HomeScreen(
                        //       firstName: googleUser.displayName!.split(" ")[0],
                        //       lastName: googleUser.displayName!.split(" ")[1],
                        //     ),
                        //   ),
                        // );
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
              ],
            ),
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
    if (otpController.text == generatedOTP) {
      // Navigate to home screen if OTP is correct
      // Replace this with your navigation logic
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => HomeScreen(
      //       phoneNumber: phoneNumberController.text,
      //     ),
      //   ),
      // );
      print('OTP Verified. Navigate to Home Screen');
    } else {
      // Show error message if OTP is incorrect
      showDialog(
        context: context,
        builder: (context) => Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            child: AlertDialog(
              title: Text('Error'),
              content: Text('Incorrect OTP. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
