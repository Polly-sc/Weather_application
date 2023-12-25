
import 'package:flutter/material.dart';
import 'package:flutter_developer_test_task/core/app_colors.dart';
import 'package:flutter_developer_test_task/core/app_font.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.splashScreenBackgroundColor,
          ),
          child: SafeArea(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          flex: 146,
                          child: Container(),
                        ),
                        Flexible(
                          flex: 114,
                          child: AspectRatio(
                            aspectRatio: 3.3,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Container(height: 245, child: FittedBox(child: Padding(padding: EdgeInsets.only(left: 53, right: 87), child: Text('WEATHER \n SERVICE', style: AppFonts.weatherWidget)))),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 144,
                          child: Container(),
                        ),
                        Flexible(
                          flex: 16,
                          child: AspectRatio(
                            aspectRatio: 11.7,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Container(height: 32, child: FittedBox(child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 63.0),
                                  child: Text('dawn is coming soon', style: AppFonts.splashScreenText),
                                )))),
                          ),
                        ),
                        Flexible(
                          flex: 43,
                          child: Container(),
                        )
                      ]
                    ),
                  ),
      )
      ),
    );
  }
}