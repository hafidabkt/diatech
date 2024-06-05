import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'color.dart';

class DonutChart extends StatefulWidget {
  final String glIndex;
  final double sugar;
  final double protein;
  final double carbs;
  final double fiber;
  final double fat;
  final double acid;

  const DonutChart({
    Key? key,
    required this.glIndex,
    required this.sugar,
    required this.protein,
    required this.carbs,
    required this.fiber,
    required this.fat,
    required this.acid,
  }) : super(key: key);

  @override
  State<DonutChart> createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  @override
  Widget build(BuildContext context) {
    final glIndex = widget.glIndex;
    final sugar = widget.sugar;
    final protein = widget.protein;
    final carbs = widget.carbs;
    final fiber = widget.fiber;
    final fat = widget.fat;
    final acid = widget.acid;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                  startDegreeOffset: 270,
                  sectionsSpace: 0,
                  centerSpaceRadius: 80,
                  sections: [
                    PieChartSectionData(
                      value: sugar,
                      color: pink,
                      radius: 60,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: protein,
                      color: yellow,
                      radius: 70,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: carbs,
                      color: brown,
                      radius: 80,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: fiber,
                      color: green,
                      radius: 90,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: fat,
                      color: orange,
                      radius: 100,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: acid,
                      color: blue,
                      radius: 110,
                      showTitle: false,
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10.0,
                            spreadRadius: 10.0,
                            offset: const Offset(3.0, 3.0),
                          ),
                        ],
                      ),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: glIndex == 'Good'
                              ? Color.fromARGB(255, 200, 250, 144)
                              : glIndex == 'Moderate'
                                  ? Colors.orange
                                  : glIndex == 'Bad'
                                      ? pink
                                      : Colors.red,
                        ),
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          glIndex,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
