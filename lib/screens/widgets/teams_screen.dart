import 'package:flutter/material.dart';
import 'package:sportify_application/data/models/team_model.dart';
import 'package:sportify_application/data/repositories/team_api_service.dart';
class TeamsScreen extends StatefulWidget {
  final int leagueId;

  TeamsScreen({required this.leagueId});

  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  late Future<List<Team>> _teamsFuture;
  late List<Team> _filteredTeams = [];
  final TeamModelService _teamModelService = TeamModelService(); // Create an instance of the TeamModelService class

  @override
  void initState() {
    super.initState();
    _teamsFuture = _teamModelService.fetchTeamData(widget.leagueId.toString()); // Fetch teams using the leagueId
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for a team...',
              prefixIcon: Icon(Icons.search),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFA1C398)),
              ),
            ),
            onChanged: _filterTeams,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Expanded(
          child: FutureBuilder<List<Team>>(
            future: _teamsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Team> teams =
                    _filteredTeams.isNotEmpty ? _filteredTeams : snapshot.data!;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the team players details screen // SARA
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 0,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(teams[index].teamLogo),
                                radius: 30.0,
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.transparent,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                teams[index].teamName,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
    );
  }
}
