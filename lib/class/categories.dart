
class Category {
  int? id;
  final String name;
  final String imageUrl;

  Category({this.id, required this.name, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}

final List<Category> categories = [
  Category(name: 'Food', imageUrl: 'images/food.png'),
  Category(name: 'Coffee', imageUrl: 'images/coffee.png'),
  Category(name: 'Fruits', imageUrl: 'images/fruits.png'),
  Category(name: 'Vegetables', imageUrl: 'images/vegi.png'),
  Category(name: 'Cheese', imageUrl: 'images/cheese.png'),
  Category(name: 'My Fridge', imageUrl: 'images/myfridge.png'),
  Category(name: 'Bread', imageUrl: 'images/bread.png'),
  Category(name: 'Drinks', imageUrl: 'images/drinks.png'),
  Category(name: 'Sweet', imageUrl: 'images/sweet.png'),
];
