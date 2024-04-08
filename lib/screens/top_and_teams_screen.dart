import 'package:flutter/material.dart';
import 'package:sportify_application/data/models/team_model.dart';
import 'package:sportify_application/data/models/topscorer_model.dart';
import 'package:sportify_application/data/repositories/team_api_service.dart';
import 'package:sportify_application/data/repositories/top_scorers_api_service.dart';
import 'package:sportify_application/screens/teams_screen.dart';
import 'package:sportify_application/screens/top_scorers_screen.dart';
import 'package:sportify_application/widget/DrawerScreen.dart';

class TopAndTeamsScreen extends StatefulWidget {
  final int leagueKey; // Define the leagueKey parameter here

  TopAndTeamsScreen(
      {required this.leagueKey}); // Add the leagueKey parameter to the constructor

  @override
  _TopAndTeamsScreenState createState() => _TopAndTeamsScreenState();
}

class _TopAndTeamsScreenState extends State<TopAndTeamsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late Future<List<Team>> _teamsFuture;
  late Future<List<TopScorer>> _topScorersFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _teamsFuture = TeamsApiService.fetchTeams(widget.leagueKey.toInt());
    _topScorersFuture = TopScorersApiService.fetchTopScorers(widget.leagueKey);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

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

          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            labelColor: Colors.white,
            tabs: [
              Tab(text: 'Teams'),
              Tab(text: 'Top Scorers'),
            ],
          ),
        ),
        drawer: drawer(),
        body: TabBarView(
          controller: _tabController,
          children: [
            TeamsScreen(
              leagueId: widget.leagueKey,
              teamsFuture: _teamsFuture,
            ),
            TopScorersScreen(leagueId: widget.leagueKey),
          ],
        ),
      ),
    );
  }
}
