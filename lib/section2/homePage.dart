import 'package:flutter/material.dart';
import 'package:sportify_application/screens/countries_screen.dart';
import 'package:sportify_application/section2/DrawerScreen.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sportify', style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xFFA1C398), // Set AppBar color to A1C398
        centerTitle: true,
      ),
      drawer: Drawer(
        child: drawer(),
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
                child: ListPlay(
                      Color.fromARGB(66, 198, 235, 197),
                  "assest/footballHomepage.png",
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
              SizedBox(width: 30),
              Expanded(
                child: ListPlay(
      Color.fromARGB(66, 198, 235, 197),
                  "assest/basketballHomepage.png",
                  "Basketball",
                  () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Coming Soon' ,style: TextStyle(color: Color(0xFFFA7070) , fontWeight: FontWeight.bold),),
                          content: Text(
                            'Basketball is coming soon!' , 
                            style: TextStyle(fontSize: 20 , color:Colors.black,),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 251, 251),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
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
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListPlay(
          Color.fromARGB(66, 198, 235, 197),
                  "assest/cricetHomepage.png",
                  "Cricket",
                  () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Coming Soon' ,style: TextStyle(color: Color(0xFFFA7070) , fontWeight: FontWeight.bold),),
                          content: Text('Cricket is coming soon!',
                          style: TextStyle(fontSize: 20 , color:Colors.black,),
                          ),
                            backgroundColor:
                              const Color.fromARGB(255, 255, 251, 251),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
  child: Text('OK' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                child: ListPlay(
            Color.fromARGB(66, 198, 235, 197),
                  "assest/tennisHomepage.png",
                  "Tennis",
                  () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Coming Soon' ,style: TextStyle(color: Color(0xFFFA7070) , fontWeight: FontWeight.bold),),
                          content: Text('Tennis is coming soon!' ,
                          style: TextStyle(fontSize: 20 , color:Colors.black,),),

                            backgroundColor:
                              const Color.fromARGB(255, 255, 251, 251),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                                child: Text('OK' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),                            ),

                            
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 170,
        
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
      ),
    );
  }
}

