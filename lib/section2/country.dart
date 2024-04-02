import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  const Country({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sportify',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(0xFFA1C398),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: const Color.fromARGB(45, 158, 158, 158),
                    child: Icon(
                      Icons.location_on,
                      color: Color(0xFFA1C398),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Riyadh, Saudi Arabia',
                    style: TextStyle(color: Colors.black , 
                    fontWeight: FontWeight.bold ),
                  ),
                ),

              ],
            ),
          ),
                                SizedBox(width: 8),
                Container(
                  margin: EdgeInsets.all( 8.0), // Add margin
                  width: 400, // Set the desired width
                  height: 50, // Set the desired height
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' Search for a country ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),

                          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListPlay( Color.fromARGB(14, 73, 73, 73), "assest/football.jpg", "Football", context),
              ),
              SizedBox(width: 30 ),
              Expanded(
                child: ListPlay( Color.fromARGB(14, 73, 73, 73), "assest/basketball.jpg","Basketball", context),
              ),
            ],
          ),

                          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListPlay( Color.fromARGB(14, 73, 73, 73), "assest/football.jpg", "Football", context),
              ),
              SizedBox(width: 30 ),
              Expanded(
                child: ListPlay( Color.fromARGB(14, 73, 73, 73), "assest/basketball.jpg","Basketball", context),
              ),
            ],
          ),
                          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListPlay( Color.fromARGB(14, 73, 73, 73), "assest/football.jpg", "Football", context),
              ),
              SizedBox(width: 30 ),
              Expanded(
                child: ListPlay( Color.fromARGB(14, 73, 73, 73), "assest/basketball.jpg","Basketball", context),
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