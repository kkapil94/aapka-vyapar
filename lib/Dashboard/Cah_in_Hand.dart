import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Cash_In_Hand extends StatefulWidget {
  const Cash_In_Hand({super.key});

  @override
  State<Cash_In_Hand> createState() => _Cash_In_HandState();
}

class _Cash_In_HandState extends State<Cash_In_Hand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text('Cash in hand', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        bottom: Prefered_underline_appbar(),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                    decoration: BoxDecoration(
                      color:  Color(0xFFC5EEE8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Current Cash Balance",style: TextStyle(fontSize: 16,color: Colors.black54),),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(" ₹58.00",style: TextStyle(fontSize: 20,color: Color(0xFF38C782),),),
                            Icon(Remix.checkbox_multiple_blank_line),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Transaction Details"),
                      Text("Amount")
                    ],
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text('Payment-out - Mitesh'),
                              subtitle: Text('06 Feb 2025'),
                              contentPadding: EdgeInsets.zero,
                              trailing: Text(
                                '₹58.00',
                                style: TextStyle(color:Color(0xFFE03537), fontWeight: FontWeight.w500,fontSize: 16),
                              ),
                            ),
                            Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children:[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(14),
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Color(0xFFE03537),width: 2),
                        ),
                        onPressed: () {
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bank Transfer",
                              style: TextStyle(color: Color(0xFFE03537),fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(14),
                          backgroundColor: Color(0xFFE03537),
                        ),
                        onPressed: () {
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Adjust Cash",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}