import 'package:dio/dio.dart';
import '../models/country_model.dart';

class CountryRepository {
  final Dio _dio = Dio();
  final String baseUrl = "https://restcountries.com/v3.1";

  Future<List<Country>> fetchCountries() async {
    try {
      final response = await _dio.get("$baseUrl/region/africa?fields=name,languages,capital,flags");
      return (response.data as List).map((json) => Country.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load countries");
    }
  }

  Future<Country> fetchCountryDetails(String name) async {
    try {
      final response = await _dio.get("$baseUrl/name/$name");
      return Country.fromJson(response.data[0]);
    } catch (e) {
      throw Exception("Failed to load country details");
    }
  }
}
