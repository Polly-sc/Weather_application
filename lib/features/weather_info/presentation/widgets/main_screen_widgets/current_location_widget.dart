import 'package:flutter/material.dart';
import 'package:flutter_developer_test_task/core/app_colors.dart';
import 'package:flutter_developer_test_task/core/app_font.dart';
import 'package:flutter_developer_test_task/core/image_assets.dart';
import 'package:flutter_developer_test_task/features/weather_info/data/models/forecast_weather_model.dart';


class CurrentLocationWidget extends StatelessWidget {
  final WeatherForecastModel weatherForecastEntity;

  const CurrentLocationWidget({super.key, required this.weatherForecastEntity});

  @override
  Widget build(BuildContext context) {
    final city = weatherForecastEntity.city != null ? weatherForecastEntity.city!.name : null;
    final country = weatherForecastEntity.cnt != null? weatherForecastEntity.city!.country : null;
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: ImageAssets.geolocationIcon,
                height: 20,
              ),
              Container(width: 12),
              Text("$city, $country", style: AppFonts.mainTextB2Medium),
            ],
          ),
        ),
      ),
    );
  }
}
