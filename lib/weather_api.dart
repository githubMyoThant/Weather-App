import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  getWeatherCity(String cityName) async {
    var cityUrl = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=32ad84d2a41f15df8af1a765bb38c530&units=metric'));
    if (cityUrl.statusCode == 200) {
      return jsonDecode(cityUrl.body);
    } else {
      throw Exception("No city with that name");
    }
  }
  getWeatherLatLon(bool lat, bool lon)async{
    var cityUrl = await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=32ad84d2a41f15df8af1a765bb38c530&units=metric'));
    if (cityUrl.statusCode == 200) {
      return jsonDecode(cityUrl.body);
    }else{
      throw Exception("No city with that Latitude and Longitude");
    }
  }
}
