import 'package:flutter/material.dart';
import 'package:flutter_developer_test_task/features/weather_info/data/models/forecast_weather_model.dart';
import 'package:flutter_developer_test_task/features/weather_info/presentation/widgets/main_screen_widgets/forecast_weather_widget/forecast_weather_element.dart';

import '../../../../../../core/app_colors.dart';

class ForecastWeatherListWidget extends StatelessWidget {
  final List<WeatherListModel> todayForecasts;

  ForecastWeatherListWidget({Key? key, required this.todayForecasts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: todayForecasts.length,
              itemBuilder: (BuildContext context, int index) {
                return index == 1
                    ? Container(
                    child: ForecastWeatherElement(todayForecasts: todayForecasts[index]),
                    decoration: BoxDecoration( color: AppColors.currentTimeWeatherAllocation,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 1,
                            color: AppColors.currentTimeWeatherAllocationBorder)))
                    : ForecastWeatherElement(todayForecasts: todayForecasts[index]);
              }
      ),
    );
  }

}
