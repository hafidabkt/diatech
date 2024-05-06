import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'popup_GI_GL.dart';
import 'listfood.dart';
import 'color.dart';
import '../class/categories.dart';

class FoodCategoryScreen extends StatefulWidget {
  @override
  State<FoodCategoryScreen> createState() => _FoodCategoryScreen();
}

class _FoodCategoryScreen extends State<FoodCategoryScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            blue, // Adjust the color to fit the search screen theme
        title: Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search button tap
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 400,
              child: Center(
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildCategoryContainer(category: categories[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: 200,
          height: 60,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: GLIndexScreen(),
                  );
                },
              );
            },
            child: Text(
              'Calculate GI GL Index',
              style: TextStyle(
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
            backgroundColor: blue,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget buildCategoryContainer({required Category category}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodListScreen()),
          );
        },
        child: Container(
          width: 120,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(category.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
