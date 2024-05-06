import 'package:flutter/material.dart';
import 'color.dart';

// Define a class to represent a food item
class FoodItem {
  final String name;
  final bool isGood; // Indicates if the food is good or bad

  FoodItem({required this.name, required this.isGood});
}

// Dummy list of food items
List<FoodItem> foodItems = [
  FoodItem(name: 'Apple', isGood: true),
  FoodItem(name: 'Chocolate', isGood: false),
  FoodItem(name: 'Salad', isGood: true),
  FoodItem(name: 'Pizza', isGood: false),
  FoodItem(name: 'Banana', isGood: true),
];

class FoodListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text('Food List'),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(foodItems[index].name),
            trailing: Icon(
              foodItems[index].isGood ? Icons.brightness_1 : Icons.cancel,
              color: foodItems[index].isGood ? Colors.green : Colors.red,
            ),
          );
        },
      ),
    );
  }
}
