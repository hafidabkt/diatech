import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:healthcare/screens/color.dart';

class BloodSugarChart extends StatelessWidget {
  final List<int> bloodSugarLevels;
  final List<String> days;

  BloodSugarChart({required this.bloodSugarLevels, required this.days});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Blood Sugar Levels',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Container(
            width: 300, // Adjust width as needed
            height: 200, // Adjust height as needed
            child: Sparkline(
              data: bloodSugarLevels.map((level) => level.toDouble()).toList(),
              enableGridLines: true,
              lineColor: blue,
              lineWidth: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
