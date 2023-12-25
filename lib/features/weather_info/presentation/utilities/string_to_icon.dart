import 'package:flutter/material.dart';
import 'package:flutter_developer_test_task/core/image_assets.dart';

Image selectIcon(String description) {
  switch (description) {
    case 'clear sky':
      return ImageAssets.sunIconBig;
    case 'few clouds':
      return ImageAssets.cloudyIconBig;
    case 'scattered clouds':
      return ImageAssets.cloudyIconBig;
    case 'broken clouds':
      return ImageAssets.cloudyIconBig;
    case 'shower rain':
      return ImageAssets.showerIconBig;
    case 'rain':
      return ImageAssets.rainIconBig;
    case 'thunderstorm':
      return ImageAssets.stormIconBig;
    case 'snow':
      return ImageAssets.snowIconBig;
    default:
      return ImageAssets.cloudyIconBig;
  }
}

Image selectMinIcon(String description, String icon) {
  switch (description) {
    case 'clear sky':
      if (icon == '01d') {
        return ImageAssets.sunIcon;
      } else {
        return ImageAssets.cloudyNightIcon;
      }
    case 'few clouds':
      if (icon == '02d') {
        return ImageAssets.cloudyIcon;
      } else {
        return ImageAssets.cloudyNightIcon;
      }
    case 'scattered clouds':
      if (icon == '03d') {
        return ImageAssets.cloudyIcon;
      } else {
        return ImageAssets.cloudyNightIcon;
      }
    case 'broken clouds':
      if (icon == '04d') {
        return ImageAssets.cloudyIcon;
      } else {
        return ImageAssets.cloudyNightIcon;
      }
    case 'shower rain':
      return ImageAssets.showerIconBig;
    case 'rain':
      return ImageAssets.rainIconBig;
    case 'thunderstorm':
      return ImageAssets.stormIconBig;
    case 'snow':
      return ImageAssets.snowIconBig;
    default:
      return ImageAssets.cloudyIconBig;
  }
}