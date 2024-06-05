import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About GI (Glycemic Index):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The Glycemic Index (GI) is a scale that ranks carbohydrate-rich foods based on how much they raise blood glucose levels compared to a standard food (usually glucose or white bread) over a set period of time. Foods with a high GI are quickly digested and cause a rapid increase in blood sugar levels, while those with a low GI are digested more slowly, leading to a gradual rise in blood sugar.',
            ),
            SizedBox(height: 16),
            Text(
              'About GL (Glycemic Load):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The Glycemic Load (GL) takes into account both the quality (GI) and quantity of carbohydrate in a serving of food. It provides a more accurate picture of a food\'s effect on blood sugar levels than GI alone. Foods with a high GL may cause a rapid rise in blood sugar, while those with a low GL have a more gradual effect.',
            ),
            SizedBox(height: 16),
            Text(
              'Relation to Diabetes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'For individuals with diabetes, managing blood sugar levels is crucial. Foods with a high GI or GL can cause spikes in blood sugar, which may be problematic for diabetes management. Therefore, focusing on consuming foods with a low to moderate GI and GL can help stabilize blood sugar levels and improve overall health.',
            ),
          ],
        ),
      ),
    );
  }
}
