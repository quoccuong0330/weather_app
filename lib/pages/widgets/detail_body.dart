import 'package:flutter/material.dart';
import 'package:instagram/models/weather.dart';
import 'package:instagram/utils/helper.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.listData});

  final List<WeatherDetail> listData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(20.0),
        itemBuilder: ((context, index) {
          return AspectRatio(
              aspectRatio: 3 / 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            getTemp(listData[index].main.temp, size: 25),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              listData[index].weather.main,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          Convert.convertDateTime(listData[index].dt_txt)[1],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          Convert.covertDayOfWeek(Convert.convertDateTime(
                              listData[index].dt_txt)[0]),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                    Image.asset(AssetCustom.getLinkImage(
                      listData[index].weather.main,
                    ))
                  ],
                ),
              ));
        }),
        separatorBuilder: (context, _) => const SizedBox(
              height: 15,
            ),
        itemCount: 20);
  }
}
