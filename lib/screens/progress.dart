import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:healthcare/screens/color.dart';

class BloodSugarChart extends StatelessWidget {
  final List<double> bloodSugarLevels;

  BloodSugarChart({required this.bloodSugarLevels});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Blood Sugar Rates',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            width: 300, // Adjust width as needed
            height: 200, // Adjust height as needed
            child: Sparkline(
              data: bloodSugarLevels,
              enableGridLines: true,
              lineColor: blue,
              lineWidth: 2.0,
              gridLineColor: Colors.grey,
              gridLineWidth: 0.5,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
