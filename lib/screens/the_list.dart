import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/screens/color.dart';
import 'food_list.dart'; // Import the FoodItem class
import 'info_screen.dart'; // Import the InfoScreen

class TheList extends StatefulWidget {
  final List<FoodItem> foodItems;

  TheList({required this.foodItems});

  @override
  _TheListState createState() => _TheListState();
}

class _TheListState extends State<TheList> {
  String glFilter = '';
  String giFilter = '';

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
        title: Text("Search"),
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
                        glFilter = selected ? 'Good' : '';
                      });
                    },
                    onModerateSelected: (selected) {
                      setState(() {
                        glFilter = selected ? 'Moderate' : '';
                      });
                    },
                    onBadSelected: (selected) {
                      setState(() {
                        glFilter = selected ? 'Bad' : '';
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
                        giFilter = selected ? 'Good' : '';
                      });
                    },
                    onModerateSelected: (selected) {
                      setState(() {
                        giFilter = selected ? 'Moderate' : '';
                      });
                    },
                    onBadSelected: (selected) {
                      setState(() {
                        giFilter = selected ? 'Bad' : '';
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
              itemCount: widget.foodItems.length,
              itemBuilder: (context, index) {
                FoodItem item = widget.foodItems[index];

                // Apply filters for both GL and GI
                if ((glFilter.isNotEmpty && _categorize(item.gl) != glFilter) ||
                    (giFilter.isNotEmpty && _categorize(item.gi) != giFilter)) {
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
        return Colors.blue;
      case 'Moderate':
        return Colors.orange;
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
        _buildCircle('Good', isGoodSelected, Colors.blue, onGoodSelected),
        SizedBox(width: 8),
        _buildCircle('Moderate', isModerateSelected, Colors.orange, onModerateSelected),
        SizedBox(width: 8),
        _buildCircle('Bad', isBadSelected, Colors.red, onBadSelected),
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

class FoodItem {
  final String name;
  final int gl;
  final int gi;

  FoodItem({required this.name, required this.gl, required this.gi});
}
