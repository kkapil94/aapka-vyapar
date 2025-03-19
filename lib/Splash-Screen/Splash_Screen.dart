import 'dart:async';
import 'package:flutter/material.dart';
import '../User Login Module/sign_up.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Sign_Up()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return Container(
            width: screenWidth,
            height: screenHeight,
            color: Color(0xFF262626),
            child: Center(
              child: CircleAvatar(
                radius: screenWidth * 0.2,
                backgroundColor: Colors.red,
                child: Container(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3,
                  child: Image.asset("Assets/Images/Vyapar_logo.png",
                      fit: BoxFit.contain),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
