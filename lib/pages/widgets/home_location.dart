import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class HomeLocation extends StatelessWidget {
  HomeLocation({super.key, required this.location});

  final dateFormat = DateFormat('dd-MM-yyyy');
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/location.png', fit: BoxFit.cover),
            const SizedBox(
              width: 10,
            ),
            textCustom('$location City')
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        textCustom((dateFormat.format(DateTime.now()))),
      ],
    );
  }
}

Widget textCustom(text) {
  return Text(
    text,
    style: const TextStyle(
        color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
  );
}
