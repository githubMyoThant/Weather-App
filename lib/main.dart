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
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
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
  getWeather() async {
    var city = await WeatherApi().getWeatherCity(city_name.text);
    setState(() {
      temperature = city['main']['temp'].toString();
      condition = city['weather'][0]['description'];
      cityName = city['name'];
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  TextEditingController city_name = TextEditingController();
  var temperature = "";
  var condition = "";
  var cityName = "Mogok";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://www.survivingwithandroid.com/wp-content/uploads/2014/11/android_weather_app.jpg"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 45, bottom: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 350,
                          child: TextField(
                            onChanged: (value) => getWeather(),
                            controller: city_name,
                            decoration: const InputDecoration(
                              labelText: "City Name",
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.gps_fixed_outlined)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(Icons.location_pin),
                      ),
                      Text(
                        cityName,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Text(condition),
                  Text(temperature),
                  // Image.asset('images/bg.webp')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
