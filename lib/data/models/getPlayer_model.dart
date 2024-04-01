class Player {
  final int playerId;
  final String playerName;
  final int leagueId;
  final int teamId;

  Player(
      {required this.playerId,
      required this.playerName,
      required this.leagueId,
      required this.teamId});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerId: json['playerId'],
      playerName: json['playerName'],
      leagueId: json['leagueId'],
      teamId: json['teamId'],
    );
  }
}
