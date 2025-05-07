import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather_app/main.dart';
import 'package:open_weather_app/models/weather_model.dart';

class LocationWeatherView extends StatelessWidget {
   LocationWeatherView({super.key});



  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as LocationWeatherArguments;
     double temperature = args.weatherModel.temperature - 273.15;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenwidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/736x/96/aa/75/96aa755d7d47b028116f21d648c44bde.jpg'),
            opacity: 0.8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("${temperature.toStringAsFixed(0)}°C",style: GoogleFonts.dancingScript(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),)
          ],
        ),
      ),
    );
  }
}

class LocationWeatherArguments{
  WeatherModel weatherModel;
  LocationWeatherArguments({required this.weatherModel});
}