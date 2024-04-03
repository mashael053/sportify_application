import 'package:dio/dio.dart';

import '../models/getPlayer_model.dart';

class GetPlayerRepo {
  final dio = Dio();

  Future<PlayerModel?> getPlayer(int? playerId) async {
    Response response;
    response = await dio.get(
        "https://apiv2.allsportsapi.com/football/?&met=Players&playerId=$playerId&APIkey=f53c5d29e56bd13d8f5c2a245c2d85121a84dfa2940addee3056a8c5649a453a");

    PlayerModel getPlayer = PlayerModel.fromJson(response.data);

    return getPlayer;
  }
}
