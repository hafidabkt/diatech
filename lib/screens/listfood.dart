import 'package:flutter/material.dart';
import 'package:healthcare/screens/color.dart';
import '../food_list.dart'; // Import the FoodItem class
import 'info_screen.dart'; // Import the InfoScreen

class FoodListScreen extends StatefulWidget {
  final String category;

  FoodListScreen({required this.category});

  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  List<FoodItem> foodItems = [];
  String? glFilter;
  String? giFilter;

  @override
  void initState() {
    super.initState();
    loadFoodItems();
  }

  void loadFoodItems() {
    // Retrieve food items based on the category
    switch (widget.category) {
      case 'Food':
        foodItems = food;
        break;
      case 'Coffee':
        foodItems = coffee;
        break;
      case 'Fruits':
        foodItems = fruit;
        break;
      case 'Vegetables':
        foodItems = vegitables;
        break;
      case 'My Fridge':
        foodItems = fridge;
        break;
      case 'Drinks':
        foodItems = drink;
        break;
      case 'Sweet':
        foodItems = sweet;
        break;
      case 'Bread':
        foodItems = bread;
        break;
    }
  }


  String _categorize(int value) {
    if (value <= 50) {
      return 'Good';
    } else if (value <= 100) {
      return 'Moderate';
    } else {
      return 'Bad';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GIFilterRow(
                    label: 'GL',
                    isGoodSelected: glFilter == 'Good',
                    isModerateSelected: glFilter == 'Moderate',
                    isBadSelected: glFilter == 'Bad',
                    onGoodSelected: (selected) {
                      setState(() {
                        glFilter = selected ? 'Good' : null;
                      });
                    },
                    onModerateSelected: (selected) {
                      setState(() {
                        glFilter = selected ? 'Moderate' : null;
                      });
                    },
                    onBadSelected: (selected) {
                      setState(() {
                        glFilter = selected ? 'Bad' : null;
                      });
                    },
                  ),
                  GIFilterRow(
                    label: 'GI',
                    isGoodSelected: giFilter == 'Good',
                    isModerateSelected: giFilter == 'Moderate',
                    isBadSelected: giFilter == 'Bad',
                    onGoodSelected: (selected) {
                      setState(() {
                        giFilter = selected ? 'Good' : null;
                      });
                    },
                    onModerateSelected: (selected) {
                      setState(() {
                        giFilter = selected ? 'Moderate' : null;
                      });
                    },
                    onBadSelected: (selected) {
                      setState(() {
                        giFilter = selected ? 'Bad' : null;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildHeaderRow(), // Add header row
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                FoodItem item = foodItems[index];

                // Apply filters for both GL and GI
                if ((glFilter != null && _categorize(item.gl) != glFilter) ||
                    (giFilter != null && _categorize(item.gi) != giFilter)) {
                  return Container();
                }

                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(item.name),
                      ),
                      SizedBox(width: 10),
                      Tooltip(
                        message: 'GL: ${item.gl}',
                        child: CircleAvatar(
                          backgroundColor: _getColorForCategory(_categorize(item.gl)),
                          child: Text(item.gl.toString(),style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      SizedBox(width: 10),
                      Tooltip(
                        message: 'GI: ${item.gi}',
                        child: CircleAvatar(
                          backgroundColor: _getColorForCategory(_categorize(item.gi)),
                          child: Text(item.gi.toString(),style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForCategory(String category) {
    switch (category) {
      case 'Good':
        return blue;
      case 'Moderate':
        return orange;
      case 'Bad':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'GI',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 37),
          Text(
            'GL',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20,)
        ],
      ),
    );
  }
}

class GIFilterRow extends StatelessWidget {
  final String label;
  final bool isGoodSelected;
  final bool isModerateSelected;
  final bool isBadSelected;
  final ValueChanged<bool>? onGoodSelected;
  final ValueChanged<bool>? onModerateSelected;
  final ValueChanged<bool>? onBadSelected;

  GIFilterRow({
    required this.label,
    required this.isGoodSelected,
    required this.isModerateSelected,
    required this.isBadSelected,
    this.onGoodSelected,
    this.onModerateSelected,
    this.onBadSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        _buildCircle('', isGoodSelected, blue, onGoodSelected),
        SizedBox(width: 8),
        _buildCircle('', isModerateSelected, orange, onModerateSelected),
        SizedBox(width: 8),
        _buildCircle('', isBadSelected, Colors.red, onBadSelected),
      ],
    );
  }

  Widget _buildCircle(String text, bool isSelected, Color color, ValueChanged<bool>? onChanged) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(!isSelected);
      },
      child: CircleAvatar(
        backgroundColor: isSelected ? color.withOpacity(0.8) : color.withOpacity(0.2),
        radius: 20,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
