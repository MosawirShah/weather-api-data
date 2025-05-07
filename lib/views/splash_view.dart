import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather_app/models/weather_model.dart';
import 'package:open_weather_app/services/location.dart';
import 'package:open_weather_app/utils/routes/name_routes.dart';
import 'package:open_weather_app/views/location_weather_view.dart';

import '../services/network.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Network network = Network();
  WeatherModel? weatherModel;
  getWeatherData() {
    Future.delayed(Duration(seconds: 3), () async {
      Position position = await Location.getCurrentLocation();
      weatherModel = await network.getOpenWeatherData(
          lat: position.latitude, lng: position.longitude);
      Navigator.of(context).pushReplacementNamed(RoutesName.locationWeatherView,
          arguments: LocationWeatherArguments(weatherModel: weatherModel!));
    });
    // var temp = weatherModel!.temperature - 273.15;
    // print("${temp.toStringAsFixed(0)}°c");
    // print(weatherModel!.clouds.toString());
    // print(weatherModel!.countryName.toString());
    // print(weatherModel!.humidity.toString());
  }

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWaveSpinner(color: Colors.brown),
      ),
    );
  }
}
