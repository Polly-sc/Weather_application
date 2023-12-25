import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_developer_test_task/core/app_colors.dart';
import 'package:flutter_developer_test_task/core/app_font.dart';
import 'package:flutter_developer_test_task/features/weather_info/data/models/forecast_weather_model.dart';
import 'package:flutter_developer_test_task/features/weather_info/presentation/widgets/main_screen_widgets/forecast_weather_widget/forecast_weather_list_widget.dart';

import '../../../utilities/translate_sec_to_date.dart';

class HourlyWidget extends StatelessWidget {
  final List<WeatherListModel> weatherList;

  const HourlyWidget({Key? key, required this.weatherList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dt = int.parse(weatherList[1].dt);
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: AppColors.weatherWidgetBackground,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
        Column(
          children: <Widget>[
            Flexible(
              flex: 56,
              child: Row(children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: double.infinity,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('Today',
                                  style: AppFonts.mainTextB1Medium))),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        height: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                                dayOfMonth(dt).toString() +
                                    '  ' +
                                    monthOfYear(dt).toString(),
                                style: AppFonts.mainTextB1Medium),
                          ),
                        )),
                  ),
                ),
              ]),
              // ),
            ),
            const Divider(
              color: AppColors.currentTimeWeatherAllocationBorder,
              height: 3,
            ),
            Flexible(
              flex: 174,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ForecastWeatherListWidget(todayForecasts: weatherList),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
