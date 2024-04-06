class Team {
  final int teamKey;
  final String teamName;
  final String teamLogo;
  final List<Player> players;

  Team({
    required this.teamKey,
    required this.teamName,
    required this.teamLogo,
    required this.players,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamKey: json['team_key'],
      teamName: json['team_name'],
      teamLogo: json['team_logo'],
      players:
          List<Player>.from(json['players'].map((x) => Player.fromJson(x))),
    );
  }
}

class Player {
  final String playerKey;
  final String playerName;
  final String? playerNumber;
  final String? playerCountry;
  final String playerType;
  final String playerAge;
  final String playerMatchPlayed;
  final String playerGoals;
  final String playerYellowCards;
  final String playerRedCards;
  final String playerImage;

  Player({
    required this.playerKey,
    required this.playerName,
    this.playerNumber,
    this.playerCountry,
    required this.playerType,
    required this.playerAge,
    required this.playerMatchPlayed,
    required this.playerGoals,
    required this.playerYellowCards,
    required this.playerRedCards,
    required this.playerImage,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerKey: json['player_key'].toString(),
      playerName: json['player_name'],
      playerNumber: json['player_number'],
      playerCountry: json['player_country'],
      playerType: json['player_type'],
      playerAge: json['player_age'],
      playerMatchPlayed: json['player_match_played'],
      playerGoals: json['player_goals'],
      playerYellowCards: json['player_yellow_cards'],
      playerRedCards: json['player_red_cards'],
      playerImage: json['player_image'] ?? "",
    );
  }
}
