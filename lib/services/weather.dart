//

//APP URLS
import 'package:flutter/material.dart';
import 'package:open_weather_app/services/location.dart';
import 'package:open_weather_app/services/network.dart';

import '../models/weather_model.dart';

const String apiKey = '5f7c435ad58034456116891cfef110eb';
const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';
class Weather{
  //The weather data on the basis of latitude and longitude
  Future<WeatherModel> getWeatherDataByLocation()async{
    Location location = Location();
    await location.getCurrentLocation();
    debugPrint("Lat:${location.latitude} and lng: ${location.longitude}");
    print("Lat:${location.latitude} and lng: ${location.longitude}");

    Network _network = Network(url: "${baseUrl}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    WeatherModel weatherModel = await _network.getOpenWeatherData();
    return weatherModel;
  }

  //The weather data on the basis of city name
  Future<WeatherModel> getWeatherDataByCityName(String cityName)async{
    Network network = Network(url: "${baseUrl}q=$cityName&appid=$apiKey&units=metric");
   WeatherModel weatherModel = await network.getOpenWeatherData();
   return weatherModel;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}