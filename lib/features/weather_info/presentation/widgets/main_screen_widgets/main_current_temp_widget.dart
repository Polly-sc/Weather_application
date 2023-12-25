import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer_test_task/core/app_font.dart';
import 'package:flutter_developer_test_task/core/image_assets.dart';
import 'package:flutter_developer_test_task/features/weather_info/data/models/forecast_weather_model.dart';
import 'package:flutter_developer_test_task/features/weather_info/presentation/utilities/string_to_icon.dart';

import '../../utilities/convert_temp.dart';

class MainCurrentTempWidget extends StatelessWidget {
  final MainModel mainEntity;
  final WeatherModel weatherEntity;
  const MainCurrentTempWidget({Key? key, required this.mainEntity, required this.weatherEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final main = weatherEntity.main;
    final description = weatherEntity.description;
    final icon = selectIcon(description);
    final temp = mainEntity.temp;
    final min = mainEntity.temp_min;
    final max = mainEntity.temp_max;
    return FittedBox(
          child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //Current Icon
                  Flexible(flex: 180, child: Container(child: icon)),
                  //Current temp
                  Flexible(flex: 72, child: Text('${toCelsius(temp).toInt()}°', style: AppFonts.weatherWidget)),
                  //Current condition
                  Flexible(flex: 24, child: Text('${main}', style: AppFonts.mainTextB1)),
                  const SizedBox(height: 8),
                  //Min and max temp of the day
                  Flexible(flex: 24, child: Text('Max:' + min.toString() + '°' + '  ' + 'Min:' + max.toString() + '°', style: AppFonts.mainTextB1)),
                ],
              ),
      );
  }
}
