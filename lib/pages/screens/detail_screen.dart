import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/models/weather.dart';
import 'package:instagram/pages/widgets/detail_body.dart';
import 'package:instagram/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().getWeatherDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1D6CF3), Color(0xFF19D2FE)])),
      child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherDetail(),
          initialData: null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }

            if (!snapshot.hasData) {
              return const Center(child: Text('No data'));
            }

            List<WeatherDetail> result = snapshot.data as List<WeatherDetail>;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: false,
                title: Row(
                  children: [
                    const Icon(CupertinoIcons.location),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(context.read<WeatherProvider>().nameCity)
                  ],
                ),
                actions: const [
                  Icon(CupertinoIcons.search),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              body: DetailBody(listData: result),
            );
          }),
    );
  }
}
