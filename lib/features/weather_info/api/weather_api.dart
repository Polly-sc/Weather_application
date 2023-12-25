import 'dart:convert';
import 'package:flutter_developer_test_task/features/weather_info/data/models/forecast_weather_model.dart';
import 'package:flutter_developer_test_task/features/weather_info/presentation/utilities/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_developer_test_task/features/weather_info/presentation/utilities/constants.dart';

class WeatherApi {

  Future<WeatherForecastModel> fetchWeatherForecast({String? city, bool? isCity}) async {

    Location location = Location();
    await location.handleLocationPermission();
    await location.getCurrentLocation();
    Map<String, String?> parameters;
    final client = http.Client();
    if(isCity == true) {
      var params = {
        'appid': Constants.WEATHER_APP_ID,
        'units':'metric',
        'q': city
      };
      parameters = params;
    } else {
      var params = {
        'appid': Constants.WEATHER_APP_ID,
        // 'units':'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = params;
    }
    var response = await client.get( Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=ca7535da513a9e565bcd575e4272c477'));
    // var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, parameters);
    // log('request: ${uri.toString()}');
    //
    // var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      print(response.statusCode);
      final forecastWeather = json.decode(response.body);
      print(WeatherForecastModel.fromJson(forecastWeather));
      print('response: ${response.body}');
      // currentCity = CityWeatherModel.fromJson(cityWeather);
      // if (currentCity != null) {
      //   allWeatherList.add(currentCity);
      // }
      // print(allWeatherList);
    }
    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}