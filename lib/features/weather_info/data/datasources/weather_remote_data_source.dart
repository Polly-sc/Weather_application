import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter_developer_test_task/core/global_types.dart';
import 'package:flutter_developer_test_task/features/weather_info/data/models/forecast_weather_model.dart';

  Future<WeatherForecastModel> getForecastWeather(Coords coords) async {
    int maxRetries = 3; // Adjust as needed
    int currentRetry = 0;
    late WeatherForecastModel allWeatherList;
    late String lon;
    late String lat;
    lon = coords.lon.toString();
    lat = coords.lat.toString();

    final client = http.Client();
    while (currentRetry < maxRetries) {
      try {
        final response = await client.get(
            Uri.parse(
                'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=ca7535da513a9e565bcd575e4272c477')
        );
        allWeatherList =
            WeatherForecastModel.fromJson(json.decode(response.body));
        return allWeatherList;
      } catch (error) {
        print('Request failed: $error');
        currentRetry++;
        // Implement exponential backoff
        final delay = Duration(seconds: pow(2, currentRetry).toInt());
        await Future.delayed(delay);
      }
    }
    throw Exception(
        'Failed to fetch forecast weather after $maxRetries attempts');
  }
