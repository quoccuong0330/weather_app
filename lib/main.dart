import 'package:flutter/material.dart';
import 'package:instagram/pages/my_app.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Position position = await _determinePosition();

  runApp(MainApp(position: position));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.position});
  final Position position;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(
        position: position,
      ),
    );
  }
}
