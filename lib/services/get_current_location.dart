import 'package:flutter_developer_test_task/core/global_types.dart';
import 'package:flutter_developer_test_task/features/weather_info/presentation/utilities/location.dart';

Future<Coords> getCurrentLocation() async{
  Location location = Location();
  await location.handleLocationPermission();
  await location.getCurrentLocation();
  return Coords(
      lat: location.latitude.toString(),
      lon: location.longitude.toString(),
  );
}