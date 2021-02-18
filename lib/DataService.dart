import 'dart:convert';

import 'package:http/http.dart' as http;
import './Models.dart';

class DataService {

  Future <WeatherResponse> getWeather(String city) async {
    final queryParameters = { 
      'q': city, 
      'appid': '8dbeaea513aaf14ae1a3a5b7f4c24cf5',
      'units': 'imperial'
      };
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  } 
}