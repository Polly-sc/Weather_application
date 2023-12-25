import 'package:flutter/material.dart';
import 'package:flutter_developer_test_task/core/app_font.dart';
import 'package:flutter_developer_test_task/features/weather_info/data/models/forecast_weather_model.dart';
import 'package:flutter_developer_test_task/features/weather_info/presentation/utilities/string_to_icon.dart';
import '../../../utilities/convert_temp.dart';
import '../../../utilities/translate_sec_to_date.dart';

class ForecastWeatherElement extends StatelessWidget{

  final WeatherListModel todayForecasts;
  const ForecastWeatherElement({Key? key, required this.todayForecasts}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final String time = hourOfDay(todayForecasts.dt_txt);
    if (todayForecasts.main != null && todayForecasts.weather != null) {
      final int temp = toCelsius(todayForecasts.main!.temp).toInt();
    final Image icon = selectMinIcon(
        todayForecasts.weather!.description, todayForecasts.weather!.icon);
    return FittedBox(
      fit: BoxFit.contain,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: 142,
          child: FittedBox(
            child: Column(
                children: <Widget>[
                  Text(time, style: AppFonts.mainTextB2Medium),
                  SizedBox(height: 16),
                  Container(height: 32, width: 32, child: icon,
                  ),
                  SizedBox(height: 16),
                  Text(temp.toString() + '°', style: AppFonts.mainTextB2Medium),
                ]
            ),
          ),
        ),
      ),
    );
  } else {
    return Container(child: Text('Weather data is not found', style: AppFonts.mainTextB2Medium));
  }
  }
}

