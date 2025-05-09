import 'package:flutter/material.dart';
import 'package:open_weather_app/main.dart';

class CityView extends StatefulWidget {
  const CityView({super.key});

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  final nameEditingController = TextEditingController();
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/736x/a9/b8/43/a9b843b45b13d393a22eca1b9f7fba1a.jpg'),
          opacity: 0.7,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox(height: 30,),

            TextField(
              decoration: InputDecoration(
                hintText: "Enter City Name",
                  hintStyle: TextStyle(
                    color: Colors.black38
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.white),
              onChanged: (value) {
                cityName = value;
                //print(cityName);
              },
            ),
            SizedBox(
              height: screenHeight! * 0.1,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(cityName);
                },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.purple),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
                child: Text(
                  "Find Weather",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
