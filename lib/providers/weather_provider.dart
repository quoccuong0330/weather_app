import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:instagram/models/weather.dart';
import 'package:instagram/repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier {
  Position? position;
  String nameCity = 'Unknown';

  updateCurrentPosition(Position currentPosition) {
    position = currentPosition;
    notifyListeners();
  }

  Future<WeatherData> getWeatherNow() async {
    WeatherData result = await ApiRepository().callApiGetWeather(position);
    nameCity = result.name;
    return result;
  }

  Future<List<WeatherDetail>> getWeatherDetail() async {
    List<WeatherDetail> result =
        await ApiRepository().callApiWeatherDetail(position);
    return result;
  }
}
