import 'package:flutter/material.dart';

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
            opacity: 0.5,)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle
            ),
            child: IconButton(onPressed: (){
              Navigator.of(context).pop(cityName);
            }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          ),
          SizedBox(height: 30,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Colors.white
            ),
            onChanged: (value){
              cityName = value;
              //print(cityName);
            },
          ),
        ],
      ),
      ),
    );
  }
}
