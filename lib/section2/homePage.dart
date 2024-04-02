import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sportify",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Color(0xFFA1C398),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                'Sports lovers, this is for you! Discover football, basketball, cricket, and tennis.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListPlay( Color.fromARGB(14, 73, 73, 73), "assest/football.jpg", "Football", context),
              ),
              SizedBox(width: 30),
              Expanded(
                child: ListPlay( Color.fromARGB(14, 73, 73, 73), "assest/basketball.jpg","Basketball", context),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListPlay( Color.fromARGB(14, 73, 73, 73), "assest/Cricket.jpg", "Cricket", context),
              ),
              SizedBox(width: 30),
              Expanded(
                child: ListPlay( Color.fromARGB(14, 73, 73, 73), "assest/Tennis.jpg", "Tennis", context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget ListPlay( Color playColor, String imagePath, String playName, BuildContext context) {
  return InkWell(
    onTap: () {},
    child: Container(
      height: 200,
      
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: playColor,
        borderRadius: BorderRadius.circular(8),
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
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
          ),


        ],
      ),
    ),
  );
}