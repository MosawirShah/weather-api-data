import 'package:flutter/material.dart';
import 'package:open_weather_app/services/network.dart';
import 'package:open_weather_app/utils/routes/app_routes.dart';
import 'package:open_weather_app/utils/routes/name_routes.dart';
import 'package:open_weather_app/views/splash_view.dart';

double? screenHeight;
double? screenwidth;

void main() {
  runApp(OpenWeatherApp());
}

class OpenWeatherApp extends StatelessWidget {
   OpenWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splashView,
      routes: AppRoutes.appRoutes(context),
    );
  }
}
