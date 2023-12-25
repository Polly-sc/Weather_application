import 'dart:core';

class WeatherForecastModel {
  late CityModel? city;
  late String cod;
  late int cnt;
  late List<WeatherListModel> list;

  WeatherForecastModel({
    required this.city,
    required this.cod,
    required this.cnt,
    required this.list
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    final List<WeatherListModel> listFromJson = [];
    json['list'].forEach((v) {
      listFromJson.add(WeatherListModel.fromJson(v));
    });
    return WeatherForecastModel(
      city: json['city'] != null
          ? CityModel.fromJson(json['city'])
          : null,
      cod: (json['cod'] is int
          ? json['cod'].toString()
          : json['cod']) as String,
      cnt: (json['cnt'] is String
          ? int.parse(json['cnt'])
          : json['cnt']) as int,
      list: listFromJson,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city?.toJson();
    data ['cod'] = cod;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityModel{

  final int id;
  final String name;
  final CoordModel? coords;
  final String country;

  CityModel
      ({required this.id,
    required this.name,
    required this.coords,
    required this.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: (json['id'] is String
          ? int.parse(json['id'])
          : json['id']) as int,
      name: json['name'] as String,
      coords: json['coord'] != null
          ? CoordModel.fromJson(json['coord'])
          : null,
      country: json['country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coord'] = (coords as CoordModel).toJson();
    data['country'] = country;
    return data;
  }
}

class CoordModel{
  final double lon;
  final double lat;

  CoordModel({
    required this.lon,
    required this.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lon: json['lon'] as double,
      lat: json['lat'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}


class WeatherListModel{
  final WeatherModel? weather;
  final MainModel? main;
  final WindModel? wind;
  final String dt;
  final String dt_txt;

  WeatherListModel({
    required this.weather,
    required this.main,
    required this.wind,
    required this.dt,
    required this.dt_txt,
  });

  factory WeatherListModel.fromJson(Map<String, dynamic> json) {
    return WeatherListModel(
      weather: json['weather'] != null
          ? WeatherModel.fromJson(json['weather'][0])
          : null,
      main: json['main'] != null
          ? MainModel.fromJson(json['main'])
          : null,
      wind: json['wind'] != null
          ? WindModel.fromJson(json['wind'])
          : null,
      dt: (json['dt'] is int
          ? json['dt'].toString()
          : json['dt']) as String,
      dt_txt: json['dt_txt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final List<dynamic> weatherToList = [weather?.toJson()];
    return {
      'weather': weatherToList,
      'main': main?.toJson(),
      'wind': wind?.toJson(),
      'dt': dt,
      'dt_txt': dt_txt,
    };
  }
}

class WindModel{
  final double speed;
  final int deg;

  WindModel({
    required this.speed,
    required this.deg,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'] is int
          ? json['speed'].toDouble()
          : json['speed'] as double,
      deg: (json['deg'] is String
          ? int.parse(json['deg'])
          : json['deg']) as int,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
      'deg': deg,
    };
  }
}

class MainModel {
  final double temp_min;
  final double temp_max;
  final int humidity;
  final double temp;

  MainModel({
    required this.temp_min,
    required this.temp_max,
    required this.humidity,
    required this.temp,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: (json['temp'] is int
          ? (json['temp']).toDouble()
          : json['temp']) as double,
      temp_min: (json['temp_min'] is int
          ? (json['temp_min']).toDouble()
          : json['temp_min']) as double,
      temp_max: (json['temp_max'] is int
          ? (json['temp_max']).toDouble()
          : json['temp_max']) as double,
      humidity: (json['humidity'] is String
          ? int.parse(json['humidity'])
          : json['humidity']) as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp.toDouble(),
      'temp_min': temp_min.toDouble(),
      'temp_max': temp_max.toDouble(),
      'humidity': humidity,
    };
  }
}

class WeatherModel{
  final int id;
  final String main;
  final String icon;
  final String description;

  WeatherModel({
    required this.id,
    required this.main,
    required this.icon,
    required this.description,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'] as int,
      main: json['main'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'icon': icon,
      'description': description,
    };
  }
}