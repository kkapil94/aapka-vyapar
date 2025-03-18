import 'dart:async';
import 'package:aapka_vyapar/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}
class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(title: "aapka vyapar")),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      color: Color(0xFF262626),
      child: Center(
        child: CircleAvatar(
          radius: 70,
          backgroundColor: Colors.red,
          child: Container(
            child: Image(image: AssetImage("Assets/Images/Vyapar_logo.png")),
          ),
        ),
      ),
    ),
    );
  }
}