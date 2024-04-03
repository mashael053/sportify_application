import 'dart:convert';

class JsonParser {
  static Team parseTeamData(String jsonData) {
    Map<String, dynamic> data = jsonDecode(jsonData);
    var result = data['result'] as List;
    var teamData = result[0];

    return Team.fromJson(teamData);
  }
}

class Team {
  String teamKey;
  String teamName;
  String teamLogo;
  List<Player> players;

  Team({
    required this.teamKey,
    required this.teamName,
    required this.teamLogo,
    required this.players,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    var playersList = json['players'] as List;
    List<Player> players = playersList.map((player) => Player.fromJson(player)).toList();

    return Team(
      teamKey: json['team_key'],
      teamName: json['team_name'],
      teamLogo: json['team_logo'],
      players: players,
    );
  }
}

class Player {
  int playerKey;
  String playerName;
  String playerNumber;
  String? playerCountry;
  String playerType;
  String playerAge;
  String playerMatchPlayed;
  String playerGoals;
  String playerYellowCards;
  String playerRedCards;
  String playerImage;

  Player({
    required this.playerKey,
    required this.playerName,
    required this.playerNumber,
    required this.playerCountry,
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
      playerKey: json['player_key'],
      playerName: json['player_name'],
      playerNumber: json['player_number'],
      playerCountry: json['player_country'],
      playerType: json['player_type'],
      playerAge: json['player_age'],
      playerMatchPlayed: json['player_match_played'],
      playerGoals: json['player_goals'],
      playerYellowCards: json['player_yellow_cards'],
      playerRedCards: json['player_red_cards'],
      playerImage: json['player_image'],
    );
  }
}