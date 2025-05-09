import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather_app/main.dart';
import 'package:open_weather_app/models/weather_model.dart';
import 'package:open_weather_app/services/weather.dart';
import 'package:open_weather_app/utils/routes/name_routes.dart';

class LocationWeatherView extends StatefulWidget {
  LocationWeatherView({super.key});

  @override
  State<LocationWeatherView> createState() => _LocationWeatherViewState();
}

class _LocationWeatherViewState extends State<LocationWeatherView> {
  int? temperature;

  String? cityName;

  String? weatherIcon;

  String? weatherMessage;

  Weather weather = Weather();

  late final args;
  @override
  didChangeDependencies(){

     final args = ModalRoute.of(context)!.settings.arguments as LocationWeatherArguments;
    updateUI(args.weatherModel);
    super.didChangeDependencies();
  }

  updateUI(WeatherModel weatherModel) {
    setState(() {
      if (weatherModel == null) {
        temperature = 0;
        cityName = "";
        weatherIcon = "";
        weatherMessage = "";
      }
      double temp = weatherModel.temperature;
      temperature = temp.toInt();
      cityName = weatherModel.cityName;
      int condition = weatherModel.condition;
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature!);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          //mainAxisAlignment: MainAxisAlignment.,
          children: [
            SizedBox(height: screenHeight! * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () async {
                    //   await updateUI(args.weatherModel);
                    },
                    icon: Icon(
                      Icons.near_me,
                      size: 40,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () async {
                      var typedCityName = await Navigator.of(context)
                          .pushNamed(RoutesName.cityNameView);
                      if(typedCityName != null){
                        WeatherModel weatherModel = await weather.getWeatherDataByCityName(typedCityName.toString());
                        updateUI(weatherModel);
                      }
                    },
                    icon: Icon(
                      Icons.location_city,
                      size: 40,
                      color: Colors.white,
                    )),
              ],
            ),
            SizedBox(height: screenHeight! * 0.1,),
            Text(weatherIcon.toString(),style: TextStyle(
                fontSize: 60
            ),),
            Center(
              child: Text(
                "$temperature°C",
                style: GoogleFonts.dancingScript(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
             Spacer(),
            Text(weatherMessage.toString(),style: GoogleFonts.dancingScript(
              fontSize: 34,
              color: Colors.white,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: screenHeight! * 0.1,)
          ],
        ),
      ),
    );
  }
}

class LocationWeatherArguments {
  WeatherModel weatherModel;
  LocationWeatherArguments({required this.weatherModel});
}
