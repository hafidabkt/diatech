import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/screens/color.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue, // Set your desired background color here
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white, // Set text color to white
                ),
              ),
              SizedBox(height: 30),
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/doctor1.jpg"),
                ),
                title: Text(
                  "Dear Programmer",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                subtitle: Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white70, // Set text color to white
                  ),
                ),
              ),
              Divider(height: 50, color: Colors.white), // Set divider color to white
              ListTile(
                onTap: () {},
                leading: Icon(
                  CupertinoIcons.person,
                  color: Colors.white, // Set icon color to white
                  size: 35,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white), // Set icon color to white
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.white, // Set icon color to white
                  size: 35,
                ),
                title: Text(
                  "Notifications",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white), // Set icon color to white
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  color: Colors.white, // Set icon color to white
                  size: 35,
                ),
                title: Text(
                  "Privacy",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white), // Set icon color to white
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.settings_suggest_outlined,
                  color: Colors.white, // Set icon color to white
                  size: 35,
                ),
                title: Text(
                  "General",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white), // Set icon color to white
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white, // Set icon color to white
                  size: 35,
                ),
                title: Text(
                  "About Us",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white), // Set icon color to white
              ),
              Divider(height: 40, color: Colors.white), // Set divider color to white
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white, // Set icon color to white
                  size: 35,
                ),
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
