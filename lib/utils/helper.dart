import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyKey {
  static String api_token_key = '003c2e7545a035372a1d2fb6589ff6fd';
}

const linkAsset = 'assets/weathers/';

class AssetCustom {
  static String getLinkImage(String name) =>
      '$linkAsset${name.replaceAll(' ', '').toLowerCase()}.png';
}

class Convert {
  static List<String> convertDateTime(String date) {
    return date.split(' ');
  }

  static String covertDayOfWeek(String date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime parsedDate = dateFormat.parse(date);
    String dayOfWeek = DateFormat('EEEE').format(parsedDate);
    return dayOfWeek;
  }
}

Widget getTemp(num temp, {double size = 80.0}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        (temp).toString(),
        style: TextStyle(
            fontSize: size,
            color: Colors.white,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold),
      ),
      Text(
        '0',
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold),
      )
    ],
  );
}
