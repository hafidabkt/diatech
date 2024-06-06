import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare/screens/change_avatar.dart';
import 'package:healthcare/screens/color.dart';
import 'package:healthcare/screens/listfood.dart';
import 'doctor_detail_screen.dart';
import '../class/categories.dart';
import 'progress.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgs = [
    "images/one.jpg",
    "images/two.jpg",
    "images/three.jpg",
    "images/four.jpg",
  ];
  final List<String> doctors = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];
  final TextEditingController _controller = TextEditingController();
  bool submit = false;
  String _userName = "Alex";
  String _userImage = "images/one.jpg";
  List<double> sugerlevel = [
    1.5,
    1,
    1.2,
    1.3,
    2.0,
    1.13,
    1,
    2,
    2.1
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello $_userName",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _navigateToEditProfile(context),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(_userImage),
                        ),
                      ),
                      SizedBox(width: 10), // Space between avatar and button
                      FloatingActionButton(
                        onPressed: () => _showBloodSugarDialog(context),
                        backgroundColor: submit ? Colors.grey : blue, // Define the color correctly
                        child: Icon(Icons.add),
                        mini: true, // Smaller button
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            BloodSugarChart(
              bloodSugarLevels: sugerlevel,
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Your Food Options",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodListScreen(category: categories[index].name),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      width: 120, // Adjust width as needed
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(categories[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          categories[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Our Doctors",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(imgs.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("images/${doctors[index]}"),
                          ),
                          const Text(
                            "Dr. Doctor Name",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "Therapist",
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToEditProfile(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          currentName: _userName,
          currentImage: _userImage,
        ),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        _userName = result['name'];
        _userImage = result['image'];
      });
    }
  }
  void _showBloodSugarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter your blood sugar rate"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/bloodtest.jpg', // Ensure you have this image in your assets
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))], // Allow only numbers and decimal point
                decoration: InputDecoration(
                  hintText: "Blood sugar rate",
                  suffixText: "mg/dL", // Display unit of measurement
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  submit = true;
                  double? newRate = double.tryParse(_controller.text);
                  if (newRate != null) {
                    sugerlevel.add(newRate);
                  }
                });
                print("Blood sugar rate: ${_controller.text}");
                Navigator.of(context).pop();
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }
}
