import 'package:flutter/material.dart';
import 'package:sportify_application/screens/Data/models/topscorer_model.dart';

class TopScorersScreen extends StatelessWidget {
  final int leagueId;
  final Future<List<TopScorer>> topScorersFuture;

  TopScorersScreen({required this.leagueId, required this.topScorersFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TopScorer>>(
      future: topScorersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<TopScorer> topScorers = snapshot.data!;
          // Build UI with top scorers data
          return ListView.builder(
            itemCount: topScorers.length,
            itemBuilder: (context, index) {
              // Build top scorer tile
              return Card(
                color: Color.fromARGB(255, 255, 255, 255),
                child: ListTile(
                  leading: Text('${index + 1}', style: TextStyle(fontSize: 14)),
                  title: Text(topScorers[index].playerName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Team: ${topScorers[index].teamName}'),
                      Text('Goals: ${topScorers[index].goals}'),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
