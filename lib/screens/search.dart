import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert';
import 'popup_GI_GL.dart';
import 'listfood.dart';
import 'color.dart';
import '../class/categories.dart';
import '../test.dart'; // Import the PhoneticSimilarityPage class

class FoodCategoryScreen extends StatefulWidget {
  @override
  State<FoodCategoryScreen> createState() => _FoodCategoryScreenState();
}

class _FoodCategoryScreenState extends State<FoodCategoryScreen> {
  String searchText = '';
  bool _isLoading = false;
  List<dynamic> _searchResults = [];

  Future<void> _search(String query) async {
    setState(() {
      _isLoading = true;
    });
    setState(() {
      _isLoading = false;
                Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PhoneticSimilarityPage (
                      reference: searchText,
                    )),
          );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) {
                  _search(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _search(searchText);
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
                child: _isLoading
                    ? CircularProgressIndicator()
                    : _searchResults.isEmpty
                        ? GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8.0,
                            ),
                            itemCount: categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return buildCategoryContainer(
                                  category: categories[index]);
                            },
                          )
                        : ListView.builder(
                            itemCount: _searchResults.length,
                            itemBuilder: (context, index) {
                              final result = _searchResults[index];
                              return ListTile(
                                title: Text(result['name']),
                              );
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
                color: Colors.white,
                fontWeight: FontWeight.bold,
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
            MaterialPageRoute(
                builder: (context) => FoodListScreen(
                      category: category.name,
                    )),
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
