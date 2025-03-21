import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sale_List extends StatefulWidget {
  const Sale_List({super.key});

  @override
  State<Sale_List> createState() => _Sale_ListState();
}

class _Sale_ListState extends State<Sale_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sale",),
      ),
    );
  }
}
