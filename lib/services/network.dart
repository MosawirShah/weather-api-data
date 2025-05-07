import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_weather_app/constants/app_urls.dart';
import 'package:open_weather_app/models/weather_model.dart';

//APP URLS
const String apiKey = '5f7c435ad58034456116891cfef110eb';
const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';

class Network {
  Future<WeatherModel> getOpenWeatherData({required double lat, required double lng}) async {
    try {
      final response = await http.get(Uri.parse("${baseUrl}lat=34.0151&lon=71.5249&appid=$apiKey"));
      final jsonData = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return WeatherModel(
            temperature: jsonData['main']['temp'],
            countryName: jsonData['sys']['country'],
            humidity: jsonData['main']['humidity'],
            clouds: jsonData['clouds']['all']);
      }else{
        throw Exception("The error arised with status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
