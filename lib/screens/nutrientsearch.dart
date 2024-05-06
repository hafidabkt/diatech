import 'package:flutter/material.dart';

class NutrientSearchScreen extends StatefulWidget {
  @override
  _NutrientSearchScreen createState() => _NutrientSearchScreen();
}

class _NutrientSearchScreen extends State<NutrientSearchScreen> {
  double weight = 0.0;
  double protein = 0.0;
  double sugar = 0.0;
  double carbs = 0.0;
  String result = '';

  void calculateResult() {
    // Add your logic here to determine if the food is good, bad, or moderate
    // For simplicity, I'm just setting some arbitrary conditions
    if (protein >= 10 && sugar <= 5 && carbs <= 20) {
      setState(() {
        result = 'Good';
      });
    } else if (protein >= 5 && sugar <= 15 && carbs <= 30) {
      setState(() {
        result = 'Moderate';
      });
    } else {
      setState(() {
        result = 'Bad';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrient Analyzer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (g)'),
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Protein (g)'),
              onChanged: (value) {
                setState(() {
                  protein = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sugar (g)'),
              onChanged: (value) {
                setState(() {
                  sugar = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Carbs (g)'),
              onChanged: (value) {
                setState(() {
                  carbs = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateResult();
              },
              child: Text('Search'),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $result',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
