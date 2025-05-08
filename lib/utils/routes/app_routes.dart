import 'package:flutter/material.dart';
import 'package:open_weather_app/utils/routes/name_routes.dart';
import 'package:open_weather_app/views/location_weather_view.dart';
import 'package:open_weather_app/views/splash_view.dart';

import '../../views/city_view.dart';

class AppRoutes{

 static Map<String, Widget Function(BuildContext)> appRoutes(BuildContext context){
    return {
      RoutesName.splashView : (context) {
        return SplashView();
      },
      RoutesName.locationWeatherView: (context){
        return LocationWeatherView();
      },
      RoutesName.cityNameView: (context){
        return CityView();
      }
    };
}
}