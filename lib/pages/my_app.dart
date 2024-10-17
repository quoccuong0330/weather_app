import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:instagram/config/theme_custom.dart';
import 'package:instagram/pages/bottom_navigation_custom/bottom_custom.dart';
import 'package:instagram/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.position});

  final Position position;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider()..updateCurrentPosition(position),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const BottomNavigationCustom(),
        theme: ThemeCustom.themeLight,
      ),
    );
  }
}
