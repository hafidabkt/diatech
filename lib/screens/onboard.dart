import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthcare/constant/constant.dart';
import 'package:healthcare/model/allinonboard_screen.dart';
import 'package:healthcare/screens/welcome_screen.dart';

class OnboardScreen extends StatefulWidget {
  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  bool showSplash = true;

  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
      "images/design4.png",
      " Your personalized solution for managing diabetes with expert guidance",
      "Welcome to our Diabetes Care App",
    ),
    AllinOnboardModel(
      "images/design3.jpg",
      "Discover the right foods for you, connect with specialists, and track your progress seamlessly",
      "Empower Your Health",
    ),
    AllinOnboardModel(
      "images/design2.jpg",
      "Benefit from real-time AI chat support, providing personalized nutrition advice and invaluable assistance on your journey to better health",
      "Expert Guidance at Your Fingertips",
    ),
  ];

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      setState(() {
        showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "DiaTech Assist",
      //     style: GoogleFonts.plusJakartaSans(
      //       color: primarygreen,
      //       fontWeight: FontWeight.w800,
      //     ),
      //   ),
      //   backgroundColor: lightgreenshede,
      // ),
      backgroundColor: Colors.white,
      body: showSplash ? buildSplashScreen() : buildOnboardScreen(),
    );
  }

  Widget buildSplashScreen() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/myback.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 260),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DIATECH",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: lightgreenshede1,
                ),
              ),
              Text(
                "Assist",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOnboardScreen() {
    return Stack(
      children: [
        PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemCount: allinonboardlist.length,
          itemBuilder: (context, index) {
            return Center(
              child: PageBuilderWidget(
                imgurl: allinonboardlist[index].imgStr,
                title: allinonboardlist[index].titlestr,
                description: allinonboardlist[index].description,
              ),
            );
          },
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              allinonboardlist.length,
              (index) => buildDot(index: index),
            ),
          ),
        ),
        if (currentIndex == allinonboardlist.length - 1)
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.25,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.08,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ));
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                      fontSize: 18,
                      color: primarygreen,
                      fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                  primary: lightgreenshede1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  final String imgurl;
  final String title;
  final String description;

  PageBuilderWidget({
    required this.imgurl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Image.asset(imgurl),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primarygreen,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primarygreen,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
