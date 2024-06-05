import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/constant/constant.dart';
import 'package:healthcare/main.dart';
import 'package:healthcare/screens/sign_up_screen.dart';
import 'package:healthcare/widgets/navbar_roots.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passToggle = true;
  String errorMessage = '';

  Future<void> signIn(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      print('Attempting sign-in...');

      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final Session? session = res.session;
      final User? user = res.user;

      print('Sign-in response received');

      // Handle sign-in response accordingly
      if (session != null && user != null) {
        print('Sign-in successful');
        scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text('Success'),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NavBarRoots(),
          ),
        );
      } else {
        // Handle sign-in failure
        print('Sign-in failed: No session or user returned');
        scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text('Sign-in failed. Please check your credentials.'),
          ),
        );
      }
    } catch (error) {
      print('Error type: ${error.runtimeType}');

      print('Error during sign-in: $error');
      // Handle sign-in failure
      setState(() {
        if (error is AuthApiException) {
          errorMessage = error.message;
          print('AuthApiException message: ${error.message}');
          print('AuthApiException statusCode: ${error.statusCode}');
        } else {
          errorMessage = 'Sign-in failed. Please try again later.';
        }
        scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      "images/login.png",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    wordSpacing: 2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Sign in to continue",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: lightgreenshede1,
                        width: 2,
                      ),
                    ),
                    labelText: "Enter Email",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: _passwordController,
                  obscureText: passToggle ? true : false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text("Enter Password"),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: passToggle
                          ? Icon(CupertinoIcons.eye_slash_fill)
                          : Icon(CupertinoIcons.eye_fill),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          signIn(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          width: 300,
                          decoration: BoxDecoration(
                            color: lightgreenshede1,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        errorMessage,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have any account?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: lightgreenshede1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
