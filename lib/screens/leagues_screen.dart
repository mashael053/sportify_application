import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportify_application/data/models/league_model.dart';
import 'package:sportify_application/data/repositories/League_repo.dart';

//import 'package:sportify_application/screens/Data/repositories/League_api_service.dart';
import 'package:sportify_application/screens/top_and_teams_screen.dart';
import 'package:sportify_application/utils/style.dart';
import 'package:sportify_application/widget/DrawerScreen.dart';

class LeaguesScreen extends StatefulWidget {
  final String? countryKey; // Define the countryKey parameter here

  LeaguesScreen({required this.countryKey});

  @override
  _LeaguesScreenState createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> {
  List<League> leagues = [];
  String d = "";

  @override
  void initState() {
    super.initState();
    if (widget.countryKey != null) {
      fetchLeagues();
    }
  }

  Future<void> fetchLeagues() async {
    if (widget.countryKey == null) {
      return;
    }
    final fetchedLeagues =
        await LeagueApiService.fetchLeagues(widget.countryKey!);

    setState(() {
      leagues = fetchedLeagues;
    });
  }

  Widget buildLeagueTile(League league) {
    return InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) =>
                TopAndTeamsScreen(leagueKey: league.leagueKey!),
          );
        },
        child: Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color.fromARGB(255, 255, 255, 255),
          elevation: 2,
          child: SizedBox(
            // Wrap the content in SizedBox to control height
            height: 80, // Adjust the height as needed
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 8, top: 8),
                  child: Container(
                    width: 100, // Adjusted width to match the original style
                    height: 100, // Adjusted height to match the original style
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      league.leagueLogo ?? '',
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        // Handle the error here
                        print('Image loading error: $exception');
                        // Return a fallback widget
                        return Image.asset(
                          'assets/ball.jpg',
                          height: 25,
                          width: 25,
                        );
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(league.leagueName, style: text_style1),
                      Text(
                        league.countryName,
                        style: text_style2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            'Sportify',
            style: TextStyle(color: Colors.black, fontFamily: "SportsWorld"),
          ),
          backgroundColor: Color(0xFFA1C398), // Set AppBar color to A1C398
          centerTitle: true,
        ),
        drawer: drawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Padding(
              padding:
                  EdgeInsets.only(left: 25, top: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(Icons.emoji_events_rounded,
                      color:
                          Color.fromARGB(181, 255, 217, 0)), // Cup winner icon
                  SizedBox(width: 10),
                  Text('Best Leagues',
                      style: GoogleFonts.getFont("Rubik",
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal)),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: leagues.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SizedBox
                        .shrink(); // Return an empty SizedBox to skip the first element
                  }

                  final league = leagues[index];
                  return buildLeagueTile(league);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
