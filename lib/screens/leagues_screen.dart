import 'package:flutter/material.dart';
import 'package:sportify_application/screens/Data/models/league_model.dart';
import 'package:sportify_application/screens/Data/repositories/League_repo.dart';

//import 'package:sportify_application/screens/Data/repositories/League_api_service.dart';
import 'package:sportify_application/screens/top_and_teams_screen.dart';
import 'package:sportify_application/section2/DrawerScreen.dart';

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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.3),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 172, 172, 172).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TopAndTeamsScreen(leagueKey: league.leagueKey!),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
          elevation: MaterialStateProperty.all(0), // Remove default elevation
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(0))), // Set border shape to sharp edge
        ),
        child: Row(
          children: [
            Image.network(
              league.leagueLogo ??
                  '', // Use the league logo URL if available, or an empty string
              width: 50,
              height: 50,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                    width: 50, height: 50); // Placeholder widget for the image
              },
            ),
            SizedBox(width: 20), //  space between the image and the text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    league.leagueName,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    league.countryName,
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leagues'),
        centerTitle: true,
        backgroundColor: Color(0xFFA1C398), // Set AppBar color to A1C398
      ),
      drawer: drawer(context),
      body: ListView.builder(
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
    );
  }
}
