import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_weather_app/models/weather_model.dart';

class Network {
  String url;
  Network({required this.url});
  Future<WeatherModel> getOpenWeatherData() async {
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return WeatherModel(
            temperature: jsonData['main']['temp'],
            cityName: jsonData['name'],
            condition: jsonData['weather'][0]['id'],
            );
      }else{
        throw Exception("The error arised with status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
