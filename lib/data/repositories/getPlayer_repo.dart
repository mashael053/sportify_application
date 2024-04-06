import 'package:dio/dio.dart';

import '../models/getPlayer_model.dart';

class GetPlayerRepo {
  final dio = Dio();

  Future<PlayerModel?> getPlayer(String? playerId) async {
    Response response;
    response = await dio.get(
        "https://apiv2.allsportsapi.com/football/?&met=Players&playerId=$playerId&APIkey=37b8927045369ddb6e0c484d1bbf164f8c0b7643e64d402f50c8608d75ce39ad");
    PlayerModel getPlayer = PlayerModel.fromJson(response.data);
    return getPlayer;
  }
}
