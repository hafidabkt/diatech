import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'color.dart';

class DonutChart extends StatefulWidget {
  final String glIndex;

  const DonutChart({Key? key, required this.glIndex});

  @override
  State<DonutChart> createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  @override
  Widget build(BuildContext context) {
    final glIndex = widget.glIndex; // Access glIndex from widget

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
                      value: 20,
                      color: pink,
                      radius: 60,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: 25,
                      color: yellow,
                      radius: 70,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: 30,
                      color: brown,
                      radius: 80,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: 15,
                      color: green,
                      radius: 90,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: 5,
                      color: orange,
                      radius: 100,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: 5,
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
                                  : glIndex == 'Poor'
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
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
