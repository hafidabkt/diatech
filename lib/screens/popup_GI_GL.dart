import 'package:flutter/material.dart';
import 'donut_chart.dart';
import 'package:flutter/services.dart';
import 'color.dart';

class GLIndexScreen extends StatefulWidget {
  @override
  _GLIndexScreenState createState() => _GLIndexScreenState();
}

class _GLIndexScreenState extends State<GLIndexScreen> {
  double sugar = 0.0;
  double protein = 0.0;
  double carbs = 0.0;
  double fiber = 0.0;
  double fat = 0.0;
  double acid = 0.0;
  String glIndex = '';
  bool showChart = false;

  void calculateGLIndex() {
    double gl = (sugar + protein) * (carbs / 100) / 100;
    setState(() {
      if (gl <= 10) {
        glIndex = 'Good';
      } else if (gl <= 20) {
        glIndex = 'Moderate';
      } else {
        glIndex = 'Bad';
      }
      showChart = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: !showChart,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Glycemic Load Index',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Grams of Sugar'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                      onChanged: (value) {
                        setState(() {
                          sugar = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Grams of Protein'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                      onChanged: (value) {
                        setState(() {
                          protein = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Grams of Carbs'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                      onChanged: (value) {
                        setState(() {
                          carbs = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Grams of Fiber'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                      onChanged: (value) {
                        setState(() {
                          fiber = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Grams of Fat'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                      onChanged: (value) {
                        setState(() {
                          fat = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Grams of Acid'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                      onChanged: (value) {
                        setState(() {
                          acid = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: calculateGLIndex,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        backgroundColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return brown;
                          } else if (states.contains(MaterialState.hovered)) {
                            return green;
                          }
                          return blue;
                        }),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Calculate GL&GI',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: showChart,
              child: Column(
                children: [
                  DonutChart(
                    glIndex: glIndex,
                    sugar: sugar,
                    protein: protein,
                    carbs: carbs,
                    fiber: fiber,
                    fat: fat,
                    acid: acid,
                  ),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildLegendItem(color: orange, text: 'Sugar'),
                      buildLegendItem(color: yellow, text: 'Carbs'),
                      buildLegendItem(color: blue, text: 'Protein'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildLegendItem(color: green, text: 'Fiber'),
                      buildLegendItem(color: brown, text: 'Fat'),
                      buildLegendItem(color: pink, text: 'Acid'),
                    ],
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showChart = false;
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return brown;
                        } else if (states.contains(MaterialState.hovered)) {
                          return green;
                        }
                        return blue;
                      }),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Try Again',
                        style: TextStyle(
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
    );
  }

  Widget buildLegendItem({required Color color, required String text}) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
