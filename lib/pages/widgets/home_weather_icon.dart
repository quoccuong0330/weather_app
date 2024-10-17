import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:instagram/utils/helper.dart';

class HomeWeather extends StatelessWidget {
  const HomeWeather({super.key, required this.nameIcon, required this.temp});
  final String nameIcon;
  final num temp;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width / 1.5,
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Image.asset(
            AssetCustom.getLinkImage(nameIcon),
            fit: BoxFit.cover,
            width: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          getTemp(temp)
        ],
      ),
    );
  }
}
