import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:instagram/models/weather.dart';
import 'package:instagram/utils/helper.dart';

class ApiRepository {
  Future<WeatherData> callApiGetWeather(Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position?.latitude}&lon=${position?.longitude}&units=metric&appid=${MyKey.api_token_key}');
      final data = res.data;

      WeatherData result = WeatherData.fromMap(data);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<WeatherDetail>> callApiWeatherDetail(Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=${position?.latitude}&lon=${position?.longitude}&units=metric&appid=${MyKey.api_token_key}');
      List data = res.data['list'];
      List<WeatherDetail> result = List<WeatherDetail>.from(
          data.map((e) => WeatherDetail.fromMap(e)).toList());
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
