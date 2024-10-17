import 'package:flutter/material.dart';
import 'package:instagram/models/weather.dart';
import 'package:instagram/pages/widgets/home_humidity.dart';
import 'package:instagram/pages/widgets/home_location.dart';
import 'package:instagram/pages/widgets/home_weather_icon.dart';
import 'package:instagram/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().getWeatherNow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF1D6CF3), Color(0xFF19D2FE)])),
            child: FutureBuilder(
              future: context.read<WeatherProvider>().getWeatherNow(),
              initialData: null,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No data'),
                  );
                }

                WeatherData data = snapshot.data as WeatherData;

                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HomeWeather(
                        nameIcon: data.weather[0].main,
                        temp: data.main.temp,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      HomeLocation(
                        location: data.name,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      HomeHumidity(
                        humidity: data.main.humidity,
                        windSpeed: data.wind.speed,
                      )
                    ]);
              },
            )));
  }
}
