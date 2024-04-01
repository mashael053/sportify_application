import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportify_application/utils/style.dart';

//TODO: delte this
String Image_1 =
    "https://imageio.forbes.com/specials-images/imageserve/5f5be112e7f395dc08ef8e58/Lionel-Messi-celebrating-scoring-a-goal-in-the-2019-20-UEFA-Champions-League/1960x0.jpg?format=jpg&width=1440";

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;

    return Container(
      height: _screensize.height * 0.8,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Player Info",
                style: text_style1,
              ),
              Spacer(), // Use Spacer to push the InkWell to the right
              InkWell(
                onTap: () {
                  shareApp("Sarah", "Saudia");
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 161, 195, 152),
                  ),
                  child: Icon(
                    Icons.ios_share,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          line,
          SizedBox(height: 10),
          Container(
            height: _screensize.height * 0.25,
            width: _screensize.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                    Image_1), // Replace Image_1 with the actual URL
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 10),
          TabBar(
            indicatorColor: Color.fromARGB(255, 250, 112, 112),
            labelColor: Color.fromARGB(255, 250, 112, 112),
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.sports_soccer)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                InformationTab(),
                StatsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> shareApp(String playerName, String playerClub) async {
  await FlutterShare.share(
      title: 'Player Info',
      text: "Name of player $playerName\nPlay in $playerClub.");
}

class InformationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.getFont("League Spartan",
                  color: Color.fromARGB(255, 1, 19, 33),
                  height: 1.5,
                  fontSize: 20),
              children: [
                TextSpan(
                  text: 'Name:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' [Player\'s Name]\n\n'),
                TextSpan(
                  text: 'Number:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' [Player\'s Number]\n\n'),
                TextSpan(
                  text: 'Country:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' [Player\'s Country]\n\n'),
                TextSpan(
                  text: 'Age:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' [Player\'s Age] \n'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
      text: TextSpan(
        style: GoogleFonts.getFont("League Spartan",
            color: Color.fromARGB(255, 1, 19, 33),
            height: 1.5,
            fontSize: 20), // Adjust line height here
        children: [
          TextSpan(
            text: 'Position:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' Player Position\n\n',
          ),
          TextSpan(
            text: 'Yellow Cards:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: ' Number of Yellow Cards\n\n',
              style: TextStyle(color: Colors.yellow)),
          TextSpan(
            text: 'Red Cards:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: ' Number of Red Cards\n\n',
              style: TextStyle(color: Colors.red)),
          TextSpan(
            text: 'Goals:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' Number of Goals\n\n',
          ),
          TextSpan(
            text: 'Assists:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' Number of Assists',
          ),
        ],
      ),
    ));
  }
}
