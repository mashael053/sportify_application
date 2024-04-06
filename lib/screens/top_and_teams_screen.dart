// lib/screens/top_and_teams_screen.dart
import 'package:flutter/material.dart';
import 'package:sportify_application/screens/Data/models/team_model.dart';
import 'package:sportify_application/screens/Data/models/topscorer_model.dart';
import 'package:sportify_application/screens/Data/repositories/team_api_service.dart';
import 'package:sportify_application/screens/Data/repositories/top_scorers_api_service.dart';
import 'package:sportify_application/screens/widgets/teams_screen.dart';
import 'package:sportify_application/screens/widgets/top_scorers_screen.dart';
import 'package:sportify_application/section2/DrawerScreen.dart';

class TopAndTeamsScreen extends StatefulWidget {
  final int leagueKey; // Define the leagueKey parameter here

  TopAndTeamsScreen(
      {required this.leagueKey}); // Add the leagueKey parameter to the constructor

  @override
  _TopAndTeamsScreenState createState() => _TopAndTeamsScreenState();
}

class _TopAndTeamsScreenState extends State<TopAndTeamsScreen> {
  late Future<List<Team>> _teamsFuture;
  late Future<List<TopScorer>> _topScorersFuture;

  @override
  void initState() {
    super.initState();
    _teamsFuture = TeamsApiService.fetchTeams(widget.leagueKey.toInt());
    _topScorersFuture = TopScorersApiService.fetchTopScorers(widget.leagueKey);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sportify',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFA1C398),
          bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.white,
            tabs: [
              Tab(text: 'Teams'),
              Tab(text: 'Top Scorers'),
            ],
          ),
        ),
        drawer: drawer(context),
        body: TabBarView(
          children: [
            TeamsScreen(leagueId: widget.leagueKey, teamsFuture: _teamsFuture),
            TopScorersScreen(leagueId: widget.leagueKey),
          ],
        ),
      ),
    );
  }
}
