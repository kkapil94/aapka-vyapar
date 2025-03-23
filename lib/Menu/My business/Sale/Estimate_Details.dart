import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:demo/Home/Transaction%20Details/Add%20Txn/Sale%20Transaction/Estimate_Quotation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Estimate_Details extends StatefulWidget {
  const Estimate_Details({super.key});

  @override
  State<Estimate_Details> createState() => _Estimate_DetailsState();
}

class _Estimate_DetailsState extends State<Estimate_Details> {

  String selected_button = "All";
  int value = 0;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Estimate Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        bottom: Prefered_underline_appbar(),
      ),
      body: Container(
        height:double.infinity,
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
                      SizedBox(width: screenwidth*0.03,),
                      Container(
                        height: 30,
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                selected_button=="Open Estimate";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:selected_button=="Open Estimate"?Colors.red.shade50:Colors.white,
                              side: BorderSide(color:selected_button=="Open Estimate"?Color(0xFFE03537):Colors.grey),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            child: Text("Open Estimate",style: TextStyle(color: selected_button=="Open Estimate"?Color(0xFFE03537):Colors.grey),)
                        ),
                      ),
                      SizedBox(width: screenwidth*0.03,),
                      Container(
                        height: 30,
                        child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                selected_button = "Close Estimate";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:selected_button=="Close Estimate"?Colors.red.shade50:Colors.white,
                              side: BorderSide(color:selected_button=="Close Estimate"?Color(0xFFE03537):Colors.grey),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            child: Text("Close Estimate",style: TextStyle(color: selected_button=="Close Estimate"?Color(0xFFE03537):Colors.grey),)
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
                            "Hey! You have no order yet.\nPlease add your sale order here.",
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
                                          hintText: "Search Estimate/Quotations",
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
                                          SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Balance",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                                  Text("₹ 900.80",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                                ],
                                              ),
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
                                                        child: Text("Convert",style: TextStyle(color: Colors.blueAccent),)
                                                    ),
                                                  )
                                                ],
                                              ),

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
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(14),
                    backgroundColor: Color(0xFFE03537),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Estimate_Quotation()));
                  },
                  child:Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Remix.add_line,color: Colors.white,size: 20,),
                      const SizedBox(width: 8),
                      Text(
                        "Add Estimate",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
