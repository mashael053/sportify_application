import 'package:dio/dio.dart';

import '../models/team_model.dart';

class TeamsApiService {
  static Dio _dio = Dio();

  static Future<List<Team>> fetchTeams(int teamKey) async {
    try {
      Response response = await _dio.get(
          "https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=$teamKey&APIkey=37b8927045369ddb6e0c484d1bbf164f8c0b7643e64d402f50c8608d75ce39ad");
      if (response.data['success'] == 1) {
        final body = response.data;
        if (body.containsKey('result')) {
          List<dynamic> teamData = body['result'];

          if (teamData.isEmpty) {
            return [];
          }

          List<Team> team =
              teamData.map((teamData) => Team.fromJson(teamData)).toList();
          return team;
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load top scorers: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching top scorers: $e');
      throw Exception('Failed to load top scorers');
    }
  }
}
