import 'package:dio/dio.dart';
import '../models/topscorer_model.dart';

class TopScorersApiService {
  static Dio _dio = Dio();

  static Future<List<TopScorer>> fetchTopScorers(int leagueId) async {
    try {
      Response response = await _dio.get(
          'https://apiv2.allsportsapi.com/football/?&met=Topscorers&leagueId=$leagueId&APIkey=37b8927045369ddb6e0c484d1bbf164f8c0b7643e64d402f50c8608d75ce39ad');
      if (response.data['success'] == 1) {
        final body = response.data;
        if (body.containsKey('result') && body['result'] is List) {
          List<dynamic> scorersData = body['result'];
          if (scorersData.isEmpty) {
            return [];
          }
          List<TopScorer> topScorers = scorersData
              .map((scorerData) => TopScorer.fromJson(scorerData))
              .toList();
          return topScorers;
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
