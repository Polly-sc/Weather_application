String getWindDirectionName(double windDirectionInDegrees, {double step = 22.5}) {
if (windDirectionInDegrees < 0) {
windDirectionInDegrees += 360;
}

final directions = [
  "North",
  "North-northeast",
  "Northeast",
  "North-northwest",
  "Northwest",
  "West-northwest",
  "West",
  "West-southwest",
  "Southwest",
  "South-southwest",
  "South",
  "South-southeast",
  "Southeast",
  "South-southeast",
  "East",
  "East-southeast",
];

return directions[windDirectionInDegrees ~/ step];
}
