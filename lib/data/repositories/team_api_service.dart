import 'package:dio/dio.dart';
import 'package:sportify_application/data/models/team_model.dart';

class TeamsApiService {
  static Dio _dio = Dio();

  static Future<List<Team>> fetchTeams(int leagueId) async {
    try {
      Response response = await _dio.get(
        'https://apiv2.allsportsapi.com/football/?met=Teams&leagueId=$leagueId&APIkey=37b8927045369ddb6e0c484d1bbf164f8c0b7643e64d402f50c8608d75ce39ad',
      );

      if (response.statusCode == 200) {
        final body = response.data;
        if (body['success'] == 1) {
          List<dynamic> teamsData = body['result'];
          List<Team> teams = teamsData
              .map((teamData) => Team.fromJson(teamData))
              .toList();
          return teams;
        } else {
          throw Exception('API request failed: ${body['error']}');
        }
      } else {
        throw Exception('Failed to load teams: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching teams: $e');
      throw Exception('Failed to load teams');
    }
  }
}
