import 'package:dio/dio.dart';
import 'package:sportify_application/data/models/countries_model.dart';

class CountryData {
  static const apiKey =
      'f53c5d29e56bd13d8f5c2a245c2d85121a84dfa2940addee3056a8c5649a453a';
  static const apiUrl =
      'https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=$apiKey';
  final Dio _dio = Dio();
  Future<List<Country>> fetchCountries() async {
    try {
      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        final parsedJson = response.data;
        final countryList = parsedJson['result'] as List<dynamic>;
        return countryList.map((json) => Country.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch countries');
      }
    } catch (e) {
      throw Exception('Failed to fetch countries: $e');
    }
  }
}
