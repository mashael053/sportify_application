import 'package:dio/dio.dart';
import 'package:sportify_application/screens/Data/models/topscorer_model.dart';

class TopScorersApiService {
  static Dio _dio = Dio();

  static Future<List<TopScorer>> fetchTopScorers(int leagueId) async {
    try {
      Response response = await _dio.get(
        'https://apiv2.allsportsapi.com/football/?&met=Topscorers&leagueId=$leagueId&APIkey=37b8927045369ddb6e0c484d1bbf164f8c0b7643e64d402f50c8608d75ce39ad',
      );

      if (response.statusCode == 200) {
        final body = response.data;
        if (body['success'] == 1) {
          List<dynamic> scorersData = body['result'];
          List<TopScorer> topScorers = scorersData
              .map((scorerData) => TopScorer.fromJson(scorerData))
              .toList();
          return topScorers;
        } else {
          throw Exception('API request failed: ${body['error']}');
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
