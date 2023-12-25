import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_developer_test_task/features/weather_info/data/models/forecast_weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


const CACHED_FORECAST = 'CACHED_FORECAST';
const CACHED_USER = 'CACHED_USER';

  Future<WeatherForecastModel> getWeatherFromCahce() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the JSON data
    final String? jsonWeather = prefs.getString(CACHED_FORECAST);
    if(jsonWeather != null) {
      final Map<String, dynamic> decodeWeather = jsonDecode(jsonWeather);
      if(decodeWeather.isNotEmpty) {
        return await WeatherForecastModel.fromJson(decodeWeather);
      } else {
        throw UnimplementedError();
      }
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> weatherToCache(WeatherForecastModel weathers) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonWeather = jsonEncode(weathers.toJson());
    await prefs.setString(CACHED_FORECAST, jsonWeather);
  }

Future<String> getUserFromCache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Get the JSON data
  final String? userUid = prefs.getString(CACHED_USER);
  if(userUid != null) {
    return userUid;
  } else {
      throw UnimplementedError();
    }
}

@override
Future<void> userToCache(String user) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(CACHED_USER, user);
}