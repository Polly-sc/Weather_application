import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developer_test_task/bloc/app_bloc.dart';
import 'package:flutter_developer_test_task/bloc/app_state.dart';
import 'package:flutter_developer_test_task/core/app_font.dart';
import 'package:flutter_developer_test_task/features/weather_info/presentation/widgets/main_screen_widgets/current_location_widget.dart';
import 'package:flutter_developer_test_task/features/weather_info/presentation/widgets/main_screen_widgets/bottom_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/app_colors.dart';
import '../widgets/main_screen_widgets/forecast_weather_widget/hourly_widget.dart';
import '../widgets/main_screen_widgets/main_current_temp_widget.dart';

class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppBloc>().state;
    if (appState is AppStateLoggedIn) {
      final forecastWeather = appState.forecastWeather;

      // Ensure forecastWeather and its list are not null before accessing properties
      if (forecastWeather != null && forecastWeather.list != null) {
        final mainEntity = forecastWeather.list[1].main;
        final weatherEntity = forecastWeather.list[1].weather;
        final windModel = forecastWeather.list[1].wind;

        return Container(
          decoration: const BoxDecoration(
            gradient: AppColors.mainPageBackgroundColor,
          ),
          child: Material(
            color: Colors.transparent,
            child: SafeArea(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Column(
                          children: [
                            Flexible(
                              flex: 300,
                              child: Center(
                                  child:
                                      Image.asset("assets/icons/ellipse.png")),
                            ),
                            Flexible(flex: 450, child: Container()),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 72,
                              child: AspectRatio(
                                aspectRatio: 5.21,
                                child: FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.contain,
                                  child: CurrentLocationWidget(
                                      weatherForecastEntity: forecastWeather),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 328,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: MainCurrentTempWidget(
                                    mainEntity: mainEntity!,
                                    weatherEntity: weatherEntity!,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 278,
                              child: AspectRatio(
                                aspectRatio: 1.35,
                                child: HourlyWidget(
                                    weatherList:
                                        forecastWeather.list.sublist(0, 4)),
                              ),
                            ),
                            Flexible(
                              flex: 120,
                              child: AspectRatio(
                                aspectRatio: 3.125,
                                child: BottomWidget(
                                    mainModel: mainEntity,
                                    windModel: windModel),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        // Handle the case where forecastWeather or its list is null
        return Container(
            // Display an appropriate placeholder or error message
            decoration: const BoxDecoration(
              gradient: AppColors.mainPageBackgroundColor,
            ),
            child: const Material(
                color: Colors.transparent,
                child: SafeArea(
                  child: Center(
                      child: Text("Weather data is not available",
                          style: AppFonts.mainTextB1)),
                )));
      }
    } else {
      return Container();
    }
  }
}
