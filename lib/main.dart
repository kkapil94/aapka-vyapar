import 'package:aapka_vyapar/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import 'Home/Home.dart';
import "Items/items.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myindex = 0;

  var arrText = [
    HomePage(),
    Text(
      "3",
      style: TextStyle(fontSize: 41, color: Colors.black),
    ),
    ItemsPageContent(),
    Text(
      "4",
      style: TextStyle(fontSize: 41, color: Colors.black),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                myindex = index;
              });
            },
            currentIndex: myindex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black54,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FlutterRemix.home_8_line), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(FlutterRemix.dashboard_line), label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: Icon(FlutterRemix.add_box_fill), label: 'Items'),
              BottomNavigationBarItem(
                  icon: Icon(FlutterRemix.menu_2_fill), label: 'Menu'),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            bottom: 55, // Position the arrow above the icons
            left: MediaQuery.of(context).size.width / 4 * myindex +
                MediaQuery.of(context).size.width / 9 -
                10,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              width: 30, // Width of the arrow base
              height: 10, // Height of the arrow tip
              child: CustomPaint(
                painter: ArrowPainter(),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: arrText[myindex],
      ),
    );
  }
}

// Custom AppBar Widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(Icons.store,
            color: Colors.blue), // Replace with your store icon
      ),
      title: const Text(
        "Company Name",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.grey),
          onPressed: () {
            // Notification action
          },
        ),
        Container(
          child: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0); // Top center
    path.lineTo(0, size.height); // Bottom left
    path.lineTo(size.width, size.height); // Bottom right
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
