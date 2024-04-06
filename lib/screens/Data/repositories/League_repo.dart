import 'package:dio/dio.dart';
import 'package:sportify_application/screens/Data/models/league_model.dart';
//import 'dart:convert';

class LeagueApiService {
  static Dio _dio = Dio();

  static Future<List<League>> fetchLeagues(String countryId) async {
    try {
      Response response = await _dio.get(
          'https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=37b8927045369ddb6e0c484d1bbf164f8c0b7643e64d402f50c8608d75ce39ad&countryId=$countryId');

      if (response.statusCode == 200) {
        final body = response.data;
        if (body['success'] == 1) {
          List<dynamic> leaguesData = body['result'];
          List<League> leagues = leaguesData
              .map((leagueData) => League.fromJson(leagueData))
              .toList();
          return leagues;
        } else {
          throw Exception('API request failed: ${body['error']}');
        }
      } else {
        throw Exception('Failed to load leagues: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching leagues: $e');
      throw Exception('Failed to load leagues');
    }
  }
}
