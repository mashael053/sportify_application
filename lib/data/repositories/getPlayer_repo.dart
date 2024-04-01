import '../models/getPlayer_model.dart';

class PlayersResponse {
  final List<Player> players;

  PlayersResponse({required this.players});

  factory PlayersResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> playerList = json['players'] ?? [];
    List<Player> players =
        playerList.map((playerJson) => Player.fromJson(playerJson)).toList();
    return PlayersResponse(players: players);
  }
}
