// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;

  Result({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Total Obtained: $points",
        style: TextStyle(
            fontSize: 30,
            color: points / 31 > 0.5 ? Colors.greenAccent : Colors.red),
      ),
    );
  }
}
