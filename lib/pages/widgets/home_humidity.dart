import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HomeHumidity extends StatelessWidget {
  const HomeHumidity({super.key, required this.humidity, required this.windSpeed});
  final num humidity;
  final num windSpeed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        humidityComponent('assets/icons/ph_wind.png', '$windSpeed km/h'),
        humidityComponent('assets/icons/humidity.png', '$humidity %')
      ],
    );
  }
}

Widget humidityComponent(imageRef, text) {
  return Column(
    children: [
      Image.asset(
        imageRef,
        fit: BoxFit.cover,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        text.toString(),
        style: const TextStyle(fontSize: 21, color: Colors.white),
      )
    ],
  );
}
