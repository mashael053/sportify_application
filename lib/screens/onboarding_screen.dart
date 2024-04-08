import 'package:flutter/material.dart';
import 'dart:async';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:sportify_application/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<OnBoarding> {
  PageController _pageController = PageController();
  int _currentPageIndex = 0;
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    // Start timer to automatically slide to next page every 3 seconds
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPageIndex < 2) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      _currentPageNotifier.value = _currentPageIndex; // Update the indicator
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                  _currentPageNotifier.value =
                      _currentPageIndex; // Update the indicator
                });
              },
              children: [
                OnboardingPage(
                  image: 'assets/OnBoarding1.png',
                  title: 'Welcome to Our App!',
                  description:
                      'Discover amazing features and enjoy using our app.',
                ),
                OnboardingPage(
                  image: 'assets/OnBoarding2.png',
                  title: 'Explore Our Features',
                  description:
                      'Explore football, basketball, cricket, and tennis with real-time updates and much more!',
                ),
                OnboardingPage(
                  image: 'assets/OnBoarding3.png',
                  title: 'Get Started Now!',
                  description:
                      'Join us today and experience a new way of using apps.',
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => loginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFFA1C398), // Button color set to A1C398
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black, // Text color set to black
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom:
                  200.0, // Adjust this value to change the position of the page indicator
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 20.0), // Add padding to the top
                child: CirclePageIndicator(
                  itemCount: 3,
                  currentPageNotifier: _currentPageNotifier,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: (screenHeight) * 0.2,
          ),
          Container(
            width: (screenWidth) * 0.9,
            height: (screenHeight) * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            title,
            style: GoogleFonts.rubik(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Text(
            description,
            style: GoogleFonts.rubik(
              fontSize: 17.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
