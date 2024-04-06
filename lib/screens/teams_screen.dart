import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportify_application/data/models/team_model.dart';
import 'package:sportify_application/screens/players_screen.dart';
import 'package:sportify_application/data/repositories/team_api_service.dart';
import 'package:sportify_application/utils/style.dart';

import '../widget/DrawerScreen.dart'; // Import the players screen

class TeamsScreen extends StatefulWidget {
  final int leagueId;
  TeamsScreen(
      {required this.leagueId, required Future<List<Team>> teamsFuture});

  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  late Future<List<Team>> _teamsFuture;
  late List<Team> _filteredTeams = [];
  TextEditingController teamSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _teamsFuture = TeamsApiService.fetchTeams(
        widget.leagueId); // Fetch teams using the leagueId
  }

  void _filterTeams(String query) {
    setState(() {
      _filteredTeams = [];
    });

    _teamsFuture.then((teams) {
      setState(() {
        _filteredTeams = teams
            .where((team) =>
                team.teamName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    });
  }

  void _navigateToPlayersScreen(int teamKey, List<Player> players) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            players_screen(players: players, teamKey: teamKey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.95,
            child: TextField(
              controller: teamSearchController,
              cursorColor: Colors.black,
              style: GoogleFonts.poppins(fontSize: 15),
              decoration: InputDecoration(
                hintText: 'Search for a team ',
                focusColor: Colors.black,
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.only(bottom: 8, left: 20, top: 8),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA1C398)),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (value) {
                _filterTeams(teamSearchController.text);
                print(teamSearchController.text);
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: FutureBuilder<List<Team>>(
              future: _teamsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Team> teams = _filteredTeams.isNotEmpty
                      ? _filteredTeams
                      : snapshot.data!;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: teams.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _navigateToPlayersScreen(
                              teams[index].teamKey,
                              teams[index]
                                  .players); // Navigate to the players screen with the team key
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Image.network(
                                      teams[index].teamLogo,
                                    )),
                                SizedBox(height: 12.0),
                                Text(
                                  teams[index].teamName,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont("Rubik",
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
