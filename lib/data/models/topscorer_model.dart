class TopScorer {
  final int playerPlace;
  final String playerName;
  final int playerKey;
  final String teamName;
  final int teamKey;
  final int goals;
  final int? assists;
  final int penaltyGoals;

  TopScorer({
    required this.playerPlace,
    required this.playerName,
    required this.playerKey,
    required this.teamName,
    required this.teamKey,
    required this.goals,
    this.assists,
    required this.penaltyGoals,
  });

  factory TopScorer.fromJson(Map<String, dynamic> json) {
    return TopScorer(
      playerPlace: json['player_place'],
      playerName: json['player_name'],
      playerKey: json['player_key'],
      teamName: json['team_name'],
      teamKey: json['team_key'],
      goals: json['goals'],
      assists: json['assists'],
      penaltyGoals: json['penalty_goals'],
    );
  }
}
