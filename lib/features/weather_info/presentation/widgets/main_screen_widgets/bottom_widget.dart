import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer_test_task/core/app_colors.dart';
import 'package:flutter_developer_test_task/core/app_font.dart';
import 'package:flutter_developer_test_task/core/image_assets.dart';

import '../../../data/models/forecast_weather_model.dart';
import '../../utilities/convert_deg.dart';
import '../../utilities/convert_hum.dart';

class BottomWidget extends StatelessWidget {
  final WindModel? windModel;
  final MainModel? mainModel;

  const BottomWidget(
      {super.key, required this.windModel, required this.mainModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.weatherWidgetBackground,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                     Container(
                        width: 295,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              width: 88,
                              child: Row(
                                children: [
                                  Container(
                                      child: ImageAssets.wind,
                                      height: 24,
                                      width: 24),
                                  SizedBox(width: 8),
                                  Container(
                                      child: windModel != null
                                      ? Text(
                                          '${windModel!.speed.toInt().toString()} m/s',
                                          style: AppFonts.mainTextB2MediumPale)
                                      : Container(),
                                      height: 22),
                                ],
                              ),
                            ),
                            Text('${getWindDirectionName(windModel!.deg.toDouble())} wind',
                                style: AppFonts.mainTextB2)
                          ],
                        ),
                      ),
                    SizedBox(height: 16),
                    Container(
                        width: 295,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              width: 88,
                              child: Row(
                                children: [
                                  Container(
                                      child: ImageAssets.humidity,
                                      height: 24,
                                      width: 24),
                                  SizedBox(width: 8),
                                  Container(
                                      child: mainModel != null
                                      ? Text(
                                          '${mainModel!.humidity.toString()} %',
                                          style: AppFonts.mainTextB2MediumPale)
                                      : Container(),
                                      height: 22),
                                ],
                              ),
                            ),
                            mainModel != null
                                ? Text('${getHumidityString(mainModel!.humidity)}',
                                style: AppFonts.mainTextB2)
                                : Container(),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            )));
  }
}
