class PlayerModel {
  int success;
  List<PlayerResult> result;

  PlayerModel({
    required this.success,
    required this.result,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      success: json['success'],
      result: List<PlayerResult>.from(
          json['result'].map((x) => PlayerResult.fromJson(x))),
    );
  }
}

class PlayerResult {
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
  String playerMinutes;
  String playerInjured;
  String playerSubstituteOut;
  String playerSubstitutesOnBench;
  String playerAssists;
  String playerIsCaptain;
  String playerShotsTotal;
  String playerGoalsConceded;
  String playerFoulsCommited;
  String playerTackles;
  String playerBlocks;
  String playerCrossesTotal;
  String playerInterceptions;
  String playerClearances;
  String playerDispossessed;
  String playerSaves;
  String playerInsideBoxSaves;
  String playerDuelsTotal;
  String playerDuelsWon;
  String playerDribbleAttempts;
  String playerDribbleSucc;
  String playerPenComm;
  String playerPenWon;
  String playerPenScored;
  String playerPenMissed;
  String playerPasses;
  String playerPassesAccuracy;
  String playerKeyPasses;
  String playerWoodworks;
  String playerRating;
  String teamName;
  String teamKey; // Change type to String
  String playerImage;

  PlayerResult({
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
    required this.playerMinutes,
    required this.playerInjured,
    required this.playerSubstituteOut,
    required this.playerSubstitutesOnBench,
    required this.playerAssists,
    required this.playerIsCaptain,
    required this.playerShotsTotal,
    required this.playerGoalsConceded,
    required this.playerFoulsCommited,
    required this.playerTackles,
    required this.playerBlocks,
    required this.playerCrossesTotal,
    required this.playerInterceptions,
    required this.playerClearances,
    required this.playerDispossessed,
    required this.playerSaves,
    required this.playerInsideBoxSaves,
    required this.playerDuelsTotal,
    required this.playerDuelsWon,
    required this.playerDribbleAttempts,
    required this.playerDribbleSucc,
    required this.playerPenComm,
    required this.playerPenWon,
    required this.playerPenScored,
    required this.playerPenMissed,
    required this.playerPasses,
    required this.playerPassesAccuracy,
    required this.playerKeyPasses,
    required this.playerWoodworks,
    required this.playerRating,
    required this.teamName,
    required this.teamKey,
    required this.playerImage,
  });

  factory PlayerResult.fromJson(Map<String, dynamic> json) {
    return PlayerResult(
      playerKey: json['player_key'] ??
          0, // Default value for int can be any suitable value
      playerName: json['player_name'] ?? "",
      playerNumber: json['player_number'] ?? "",
      playerCountry: json['player_country'] ?? "",
      playerType: json['player_type'] ?? "",
      playerAge: json['player_age'] ?? "",
      playerMatchPlayed: json['player_match_played'] ?? "",
      playerGoals: json['player_goals'] ?? "",
      playerYellowCards: json['player_yellow_cards'] ?? "",
      playerRedCards: json['player_red_cards'] ?? "",
      playerMinutes: json['player_minutes'] ?? "",
      playerInjured: json['player_injured'] ?? "",
      playerSubstituteOut: json['player_substitute_out'] ?? "",
      playerSubstitutesOnBench: json['player_substitutes_on_bench'] ?? "",
      playerAssists: json['player_assists'] ?? "",
      playerIsCaptain: json['player_is_captain'] ?? "",
      playerShotsTotal: json['player_shots_total'] ?? "",
      playerGoalsConceded: json['player_goals_conceded'] ?? "",
      playerFoulsCommited: json['player_fouls_commited'] ?? "",
      playerTackles: json['player_tackles'] ?? "",
      playerBlocks: json['player_blocks'] ?? "",
      playerCrossesTotal: json['player_crosses_total'] ?? "",
      playerInterceptions: json['player_interceptions'] ?? "",
      playerClearances: json['player_clearances'] ?? "",
      playerDispossessed: json['player_dispossessed'] ?? "",
      playerSaves: json['player_saves'] ?? "",
      playerInsideBoxSaves: json['player_inside_box_saves'] ?? "",
      playerDuelsTotal: json['player_duels_total'] ?? "",
      playerDuelsWon: json['player_duels_won'] ?? "",
      playerDribbleAttempts: json['player_dribble_attempts'] ?? "",
      playerDribbleSucc: json['player_dribble_succ'] ?? "",
      playerPenComm: json['player_pen_comm'] ?? "",
      playerPenWon: json['player_pen_won'] ?? "",
      playerPenScored: json['player_pen_scored'] ?? "",
      playerPenMissed: json['player_pen_missed'] ?? "",
      playerPasses: json['player_passes'] ?? "",
      playerPassesAccuracy: json['player_passes_accuracy'] ?? "",
      playerKeyPasses: json['player_key_passes'] ?? "",
      playerWoodworks: json['player_woodworks'] ?? "",
      playerRating: json['player_rating'] ?? "",
      teamName: json['team_name'] ?? "",
      teamKey: json['team_key'].toString() ?? "", // Convert to String
      playerImage: json['player_image'] ?? "",
    );
  }

  factory PlayerResult.empty() {
    return PlayerResult(
      playerKey: 0,
      playerName: '',
      playerNumber: '',
      playerCountry: '',
      playerType: '',
      playerAge: '',
      playerMatchPlayed: '',
      playerGoals: '',
      playerYellowCards: '',
      playerRedCards: '',
      playerMinutes: '',
      playerInjured: '',
      playerSubstituteOut: '',
      playerSubstitutesOnBench: '',
      playerAssists: '',
      playerIsCaptain: '',
      playerShotsTotal: '',
      playerGoalsConceded: '',
      playerFoulsCommited: '',
      playerTackles: '',
      playerBlocks: '',
      playerCrossesTotal: '',
      playerInterceptions: '',
      playerClearances: '',
      playerDispossessed: '',
      playerSaves: '',
      playerInsideBoxSaves: '',
      playerDuelsTotal: '',
      playerDuelsWon: '',
      playerDribbleAttempts: '',
      playerDribbleSucc: '',
      playerPenComm: '',
      playerPenWon: '',
      playerPenScored: '',
      playerPenMissed: '',
      playerPasses: '',
      playerPassesAccuracy: '',
      playerKeyPasses: '',
      playerWoodworks: '',
      playerRating: '',
      teamName: '',
      teamKey: '',
      playerImage: '',
    );
  }
}
