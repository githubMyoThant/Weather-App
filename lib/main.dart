// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:weather/weather_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Weather(),
    );
  }
}

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  TextEditingController city_name = TextEditingController();
  var temperature = "";
  var condition = "";
  var cityName = "";
  var lat = "";
  var lon = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextField(
            controller: city_name,
          ),
          ElevatedButton(
              onPressed: () async {
                var city = await WeatherApi().getWeatherCity(city_name.text);
                setState(() {

                  temperature = city['main']['temp'].toString();
                  condition = city['weather'][0]['description'];
                  cityName = city['name'];
                  // lon = city['coord']['lon'];
                  // lat = city['coord']['lat'];
                });
              },
              child: const Text("Search")),
              // ElevatedButton(onPressed: (() async{
              //   var city = await WeatherApi().getWeatherLatLon(lat, lon);
              // }), child: const Text("Search with latitude and longitude")),
          Text(temperature),
          Text(condition),
          Text(cityName),
        ],
      ),
    );
  }
}
