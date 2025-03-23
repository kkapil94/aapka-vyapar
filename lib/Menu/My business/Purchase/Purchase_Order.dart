import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Purchase_Order_menu extends StatefulWidget {
  const Purchase_Order_menu({super.key});

  @override
  State<Purchase_Order_menu> createState() => _Purchase_Order();
}

class _Purchase_Order extends State<Purchase_Order_menu> {

  String selected_button = "All";
  int value = 0;

  @override
  Widget build(BuildContext context) {

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        bottom: Prefered_underline_appbar(),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text("Purchase Order",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                selected_button = "All";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:selected_button=="All"?Colors.red.shade50:Colors.white,
                              side: BorderSide(color:selected_button=="All"?Color(0xFFE03537):Colors.grey),
                              padding: EdgeInsets.zero,
                            ),
                            child: Text("All",style: TextStyle(color: selected_button=="All"?Color(0xFFE03537):Colors.grey),)
                        ),
                      ),
                      SizedBox(width: screenwidth*0.05,),
                      Container(
                        height: 30,
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                selected_button="Open Orders";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:selected_button=="Open Orders"?Colors.red.shade50:Colors.white,
                              side: BorderSide(color:selected_button=="Open Orders"?Color(0xFFE03537):Colors.grey),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            child: Text("Open Orders",style: TextStyle(color: selected_button=="Open Orders"?Color(0xFFE03537):Colors.grey),)
                        ),
                      ),
                      SizedBox(width: screenwidth*0.05,),
                      Container(
                        height: 30,
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                selected_button = "Close Orders";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:selected_button=="Close Orders"?Colors.red.shade50:Colors.white,
                              side: BorderSide(color:selected_button=="Close Orders"?Color(0xFFE03537):Colors.grey),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            child: Text("Close Orders",style: TextStyle(color: selected_button=="Close Orders"?Color(0xFFE03537):Colors.grey),)
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: screenwidth,
                    color: Colors.blue.shade50,
                    child: Expanded(
                      child: value == 1
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Icon(Remix.survey_line,color: Colors.blueAccent,size: 100,),
                          ),
                          Text(
                            "Hey! You have no order yet.\nPlease add your Purchase order here.",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                        ],
                      )
                          : Column(
                          children: [
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Search purchase Orders",
                                          hintStyle:
                                          TextStyle(fontSize: 13, color: Colors.grey),
                                          prefixIcon: Icon(
                                            Remix.search_line,
                                            color: Colors.blue,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Expanded(
                              child: ListView.builder(
                                itemCount: 1,
                                padding: EdgeInsets.only(top: 8),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Mohit",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.orange.shade100,
                                                          borderRadius:
                                                          BorderRadius.circular(15),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                                          child: Text(
                                                            "OPEN",
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.orange.shade900,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text("₹ 9.80")
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "#1",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    "21 Jan, 25",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                          SizedBox(height: 12),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.7,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Advance",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                                    Text("₹ 9.80",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                                  ],
                                                ),

                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Balance",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                                    Text("₹ 9.80",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                                  ],
                                                ),


                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Due Date",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                                    Text("11 Mar,25",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: ElevatedButton(
                                                    onPressed: (){},
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors.blue.shade50,
                                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                                    ),
                                                    child: Text("Convert to Purchase",style: TextStyle(color: Colors.blueAccent),)
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
