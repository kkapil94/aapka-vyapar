import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class Payable extends StatefulWidget {
  Payable({super.key});

  @override
  State<Payable> createState() => _PayableState();
}

class _PayableState extends State<Payable> {
  List<Map<String, dynamic>> receivables = [
    {"name": "Mohit", "amount": 5900},
    {"name": "Mohit", "amount": 5900},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        title: Text("Payable",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
        backgroundColor: Color(0xFF0078AA),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        actions: [
          IconButton(
            icon: Icon(Remix.notification_4_line, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Remix.more_2_line, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.grey.shade200,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for Name / No. / Address etc.",
                  hintStyle: TextStyle(fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12), // Better alignment
                ),
              ),
            ),
          ),


          // Table Header
          SizedBox(height:10,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            color: Colors.blue.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Party Name", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Amount", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // List of Receivables
          Expanded(
            child: ListView.builder(
              itemCount: receivables.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        receivables[index]['name'],
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "₹ ${receivables[index]['amount']}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
