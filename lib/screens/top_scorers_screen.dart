import 'package:flutter/material.dart';
import 'package:sportify_application/data/models/topscorer_model.dart';

import '../data/repositories/top_scorers_api_service.dart';

class TopScorersScreen extends StatefulWidget {
  final int leagueId;

  TopScorersScreen({required this.leagueId});

  @override
  _TopScorersScreenState createState() => _TopScorersScreenState();
}

class _TopScorersScreenState extends State<TopScorersScreen> {
  late Future<List<TopScorer>> _topScorersFuture;

  @override
  void initState() {
    super.initState();
    _topScorersFuture = TopScorersApiService.fetchTopScorers(widget.leagueId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<TopScorer>>(
        future: _topScorersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<TopScorer> topScorers = snapshot.data!;
            return ListView.builder(
              itemCount: topScorers.length,
              itemBuilder: (context, index) {
                TopScorer topScorer = topScorers[index];
                return _buildTopScorerItem(context, topScorer, index);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildTopScorerItem(
      BuildContext context, TopScorer topScorer, int index) {
    return AnimatedContainer(
      duration: Duration(seconds: 19),
      curve: Curves.linear,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: index < 3 ? Color(0xFFFEFDED) : Color.fromARGB(0, 221, 221, 221),
        borderRadius: BorderRadius.circular(20.0), // Add rounded corners
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 228, 228, 228).withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFFC6EBC5),
          child: Text('${index + 1}'),
        ),
        title: Text(topScorer.playerName!),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Team: ${topScorer.teamName}'),
            Text('Goals: ${topScorer.goals}'),
            Text('Penalty Goals: ${topScorer.penaltyGoals}'),
          ],
        ),
      ),
    );
  }
}
