import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportify_application/data/models/topscorer_model.dart';
import 'package:sportify_application/utils/style.dart';

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
    return Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
        elevation: 2,
        child: SizedBox(
          // Wrap the content in SizedBox to control height
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFC6EBC5),
                    child: Text('${index + 1}'),
                  ),
                ]),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topScorer.playerName!,
                      style: text_style1,
                    ),
                    Text(
                      'Team: ${topScorer.teamName}',
                      style: text_style2,
                    ),
                    Text(
                      'Goals: ${topScorer.goals}',
                      style: text_style2,
                    ),
                    Text(
                      'Penalty Goals: ${topScorer.penaltyGoals}',
                      style: text_style2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
