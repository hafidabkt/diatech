import 'package:flutter/material.dart';
Color green = Color(0xFF536001);
Color pink = Color(0xFFFF7C71);
Color orange = Color(0xFFFFB337);
Color yellow = Color(0xFFFCD6AE);
Color brown = Color(0xFFFB55A1C);
Color blue = Color(0xFF96CBB5);


class User {
  String name;
  String imageUrl;

  User({required this.name, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}

User me = User(name: 'hafida', imageUrl:'images/one.jpg');
