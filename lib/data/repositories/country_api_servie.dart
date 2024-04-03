import 'package:dio/dio.dart';
import 'package:sportify_application/data/models/countries_model.dart';
class CountryData {
  static const apiKey = '37b8927045369ddb6e0c484d1bbf164f8c0b7643e64d402f50c8608d75ce39ad';
  static const apiUrl = 'https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=$apiKey';
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