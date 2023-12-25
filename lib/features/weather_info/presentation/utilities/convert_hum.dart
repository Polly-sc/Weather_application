String getHumidityString(int humidity) {
  final strings = [
    "Very low humidity",
    "Low humidity",
    "Normal humidity",
    "High humidity",
    "Very high humidity",
  ];

  return strings[humidity ~/ 25];
}
