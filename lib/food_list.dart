import 'package:flutter/material.dart';

class FoodItem {
  final String name;
  final int gi;
  final int gl;

  FoodItem({
    required this.name,
    required this.gi,
    required this.gl,
  });
}

List<FoodItem> bread = [
  FoodItem(name: 'Apple', gi: 30, gl: 20),
  FoodItem(name: 'Chocolate', gi: 90, gl: 45),
  FoodItem(name: 'Salad', gi: 15, gl: 10),
  FoodItem(name: 'Pizza', gi: 80, gl: 60),
  FoodItem(name: 'Banana', gi: 50, gl: 30),
];

List<FoodItem> food = [];

List<FoodItem> coffee = [];

List<FoodItem> fruit = [];
        
List<FoodItem> vegitables = [];
        
List<FoodItem> fridge = [];
      
List<FoodItem> drink = [];

List<FoodItem> sweet = [];
