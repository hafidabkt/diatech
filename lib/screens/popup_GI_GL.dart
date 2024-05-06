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
  String glIndex = '';
  bool showChart = false; // Flag to control chart visibility

  // Function to calculate the GL index
  void calculateGLIndex() {
    double gl = (sugar + protein) * (carbs / 100) / 100;
    if (gl <= 10) {
      setState(() {
        glIndex = 'Good';
        showChart = true; // Set flag to true to show the chart
      });
    } else if (gl <= 20) {
      setState(() {
        glIndex = 'Moderate';
        showChart = true; // Set flag to true to show the chart
      });
    } else {
      setState(() {
        glIndex = 'Bad';
        showChart = true; // Set flag to true to show the chart
      });
    }
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
                    SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {
                        calculateGLIndex();
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // small radius
                          ),
                        ),
                        backgroundColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return brown; // color when pressed
                          } else if (states.contains(MaterialState.hovered)) {
                            return green; // color when hovered
                          }
                          return blue; // default color
                        }),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'GL&GI',
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
              visible: showChart, // Only show the chart if the flag is true
              child: Column(
                children: [
                  DonutChart(glIndex: glIndex),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Sugar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: yellow,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Carbs',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Sugar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Protein',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: brown,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Protein',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: pink,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Sugar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
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
                          borderRadius: BorderRadius.circular(8.0), // small radius
                        ),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return brown; // color when pressed
                        } else if (states.contains(MaterialState.hovered)) {
                          return green; // color when hovered
                        }
                        return blue; // default color
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
}
