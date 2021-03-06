import 'dart:convert';
import 'package:weather_app_api/pages/model.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
///city weather taking
    final queryParameters = {
      'q': city,
      'appid': '1213601c6ce2f765be09a55018655b08',
      'units': 'imperial'
    };
///from url taking the data from api
    final uri = Uri.https(
        'api.openweathermap.org','/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}