import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather_app/models/weather_model.dart';
import 'package:open_weather_app/services/location.dart';
import 'package:open_weather_app/services/weather.dart';
import 'package:open_weather_app/utils/routes/name_routes.dart';
import 'package:open_weather_app/views/location_weather_view.dart';

import '../services/network.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  //Get Weather data
  getWeatherData()async{
    Weather weatherObj = Weather();
   WeatherModel weatherModel = await weatherObj.getWeatherDataByLocation();
   Navigator.of(context).pushReplacementNamed(RoutesName.locationWeatherView,arguments: LocationWeatherArguments(weatherModel: weatherModel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWaveSpinner(color: Colors.brown,size: 40,),
      ),
    );
  }
}
