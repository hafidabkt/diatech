import 'package:flutter/material.dart';
import 'package:healthcare/screens/color.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentImage;

  EditProfileScreen({required this.currentName, required this.currentImage});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _selectedImage;
  bool _isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.currentName;
    _selectedImage = widget.currentImage;
  }

  void _selectImage(String image) {
    setState(() {
      _selectedImage = image;
    });
  }

  void _setButtonPressed(bool isPressed) {
    setState(() {
      _isButtonPressed = isPressed;
    });
  }

  void _saveProfile() {
    Navigator.of(context).pop({
      'name': _nameController.text,
      'image': _selectedImage,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Edit Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 20),
            Text("Select Profile Picture"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildImageOption("images/one.jpg"),
                _buildImageOption("images/two.jpg"),
                _buildImageOption("images/three.jpg"),
                _buildImageOption("images/four.jpg"),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTapDown: (_) => _setButtonPressed(true),
              onTapUp: (_) => _setButtonPressed(false),
              onTapCancel: () => _setButtonPressed(false),
              onTap: _saveProfile,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: _isButtonPressed ? 110 : 120,
                height: _isButtonPressed ? 45 : 50,
                decoration: BoxDecoration(
                  color: _isButtonPressed ? Colors.blue[700] : blue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    if (!_isButtonPressed)
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 10,
                      ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageOption(String imagePath) {
    return GestureDetector(
      onTap: () => _selectImage(imagePath),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _selectedImage == imagePath ? Colors.blue : Colors.transparent,
            width: 3,
          ),
        ),
        child: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }
}
