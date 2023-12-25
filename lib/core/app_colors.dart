import 'package:flutter/material.dart';

class AppColors {
  static const LinearGradient mainPageBackgroundColor = LinearGradient(
    colors: [
      mainBackgroundFirstColor,
      mainBackgroundSecondColor,
    ],
    stops: [
      0.0,
      0.95
    ],
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
    tileMode: TileMode.repeated,
  );

  static const LinearGradient splashScreenBackgroundColor = LinearGradient(
    colors: [
      splashScreenFirstColor,
      splashScreenSecondColor,
    ],
    stops: [
      0.0,
      0.95
    ],
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
    tileMode: TileMode.repeated,
  );

  static const RadialGradient ellipseGradient = RadialGradient(
    colors: [
      ellipseColor,
      Colors.transparent,
    ],
    stops: [
      0.0,
      1,
    ],
  );

  //Main page back colors
  static const Color mainBackgroundFirstColor = Color.fromRGBO(7, 0, 255, 0.44);
  static const Color mainBackgroundSecondColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color ellipseColor = Color.fromRGBO(189, 135, 255, 1);

  //Splash screen back colors
  static const Color splashScreenFirstColor = Color.fromRGBO(7, 0, 255, 1);
  static const Color splashScreenSecondColor = Color.fromRGBO(0, 0, 0, 1);

  //Registration page back colors
  static const Color registrationBackColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color primaryRed = Color.fromRGBO(255, 88, 93, 1);

  //Widgets colors
  static const Color weatherWidgetBackground = Color.fromRGBO(255, 255, 255, 0.2);
  static const Color currentTimeWeatherAllocation = Color.fromRGBO(255, 255, 255, 0.4);
  static const Color currentTimeWeatherAllocationBorder = Color.fromRGBO(255, 255, 255, 1);

  //Text colors
  static const Color textColorWhite = Color.fromRGBO(255, 255, 255, 1);
  static const Color textColorHeader = Color.fromRGBO(43, 45, 51, 1);
  static const Color textColorGrey = Color.fromRGBO(135, 153, 165, 1);
  static const Color textColorPale = Color.fromRGBO(255, 255, 255, 0.2);
  static const Color textColorPaleBlack = Color.fromRGBO(43, 45, 51, 0.4);

  //Buttons colors
  static const Color buttonColor = Color.fromRGBO(7, 0, 255, 1);

}