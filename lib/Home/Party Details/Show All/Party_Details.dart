import 'package:demo/Home/Party%20Details/Add_new_party.dart';
import 'package:demo/Home/Transaction%20Details/Add%20Txn/Sale%20Transaction/add_new_sales.dart';
import 'package:demo/Home/Transaction%20Details/Add%20Txn/Sale%20Transaction/payment-in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class Party_Details extends StatefulWidget {
  const Party_Details({super.key});

  @override
  State<Party_Details> createState() => _Party_DetailsState();
}

class _Party_DetailsState extends State<Party_Details> {

  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text("Party Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_new_Party()));
              },
              icon: Icon(Remix.pencil_line)
          ),
          IconButton(
              onPressed: (){
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    builder: (context){
                      return Container(
                        height: MediaQuery.of(context).size.height*0.27,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("More Actions",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  IconButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Remix.close_line,size: 25,)
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade200,thickness: 1,),
                            ListTile(
                              dense: true,
                              visualDensity: VisualDensity.compact,
                              title: Text("Schedule Reminder"),
                              leading: Icon(Remix.alarm_line,color: Colors.blueAccent,),
                            ),
                            Divider(color: Colors.grey.shade200,thickness: 1,),

                            ListTile(
                              dense: true,
                              visualDensity: VisualDensity.compact,
                              title: Text("Chat on WhatsApp"),
                              leading: Icon(Remix.whatsapp_line,color:Color(0xFF38C782),),
                            ),
                            Divider(color: Colors.grey.shade200,thickness: 1,),

                            ListTile(
                              dense: true,
                              visualDensity: VisualDensity.compact,
                              title: Text("Send PDF"),
                              leading: Icon(Remix.file_pdf_2_line,color:Color(0xFFE03537),),
                            ),

                          ],
                        ),
                      );
                    }
                );
              },
              icon: Icon(Remix.more_2_line)
          ),
        ],
      ),
      backgroundColor: Colors.blue.shade50,
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Mayur",style: TextStyle(fontSize: 11),),
                                    Row(
                                      children: [
                                        Text("7096395426",style: TextStyle(fontSize: 11,),),
                                        Icon(Remix.phone_line,size: 15,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade50,
                                            borderRadius: BorderRadius.circular(90),
                                          ),
                                          child:Icon(Remix.arrow_left_down_line, color: Color(0xFF38C782), size: 15),
                                        ),
                                        Text("Receivable : ₹ 18,00.0",style: TextStyle(fontSize: 11,color: Color(0xFF38C782)),),
                                      ],
                                    ),
                                    Text("No creadit Limit set",style: TextStyle(fontSize: 11),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey.shade100,
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                      backgroundColor: Colors.grey.shade100,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Remix.notification_3_line,color: Colors.blueAccent,),
                                        SizedBox(width: 10,),
                                        Text("Send Reminder",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blueAccent),)
                                      ],
                                    )
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                      backgroundColor: Colors.grey.shade100,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Remix.slideshow_line,color: Colors.blueAccent,),
                                        SizedBox(width: 10,),
                                        Text("Send Statement",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blueAccent),)
                                      ],
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: value == 1
                      ? Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("Assets/Images/note.png"),
                      ),
                      const Text(
                        "Hey! You have not added any transactions yet.\nAdd your first transaction now.",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                      : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal:  8.0,vertical: 8),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
                                  Text(
                                    "Mohit",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
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
                              SizedBox(height: 8),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "₹ 500.00",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Balance",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "₹ 500.00",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 9,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          child: Icon(
                                            Remix.printer_line,
                                            color: Colors.grey,
                                          ),
                                        ),

                                        GestureDetector(
                                          onTap: () {
                                            double screenWidth = MediaQuery.of(context).size.width;
                                            double screenHeight = MediaQuery.of(context).size.height;

                                            showModalBottomSheet(
                                              backgroundColor: Colors.white,
                                              context: context,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                              ),
                                              builder: (context) {
                                                return Container(
                                                  height: screenHeight * 0.25, // Responsive height
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: screenWidth * 0.04, // Responsive horizontal padding
                                                    vertical: screenHeight * 0.015, // Responsive vertical padding
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      // Share Transaction Header
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                                                        child: Text(
                                                          "Share transaction",
                                                          style: TextStyle(
                                                            fontSize: screenWidth * 0.045, // Responsive font size
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),

                                                      // Row for Share as Image & Share as PDF
                                                      Row(
                                                        children: [
                                                          // Share as Image
                                                          Expanded(
                                                            child: Padding(
                                                              padding: EdgeInsets.all(screenWidth * 0.02),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Colors.red,
                                                                  borderRadius: BorderRadius.circular(4),
                                                                ),
                                                                padding: EdgeInsets.symmetric(
                                                                  horizontal: screenWidth * 0.04,
                                                                  vertical: screenHeight * 0.015,
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      height: screenHeight * 0.04,
                                                                      width: screenHeight * 0.04,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        borderRadius: BorderRadius.circular(90),
                                                                      ),
                                                                      child: Icon(
                                                                        Remix.image_line,
                                                                        color: Colors.red,
                                                                        size: screenWidth * 0.06, // Responsive icon size
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: screenWidth * 0.02),
                                                                    Flexible(
                                                                      child: Text(
                                                                        "Share as Image",
                                                                        style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontSize: screenWidth * 0.035,
                                                                        ),
                                                                        overflow: TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          // Share as PDF
                                                          Expanded(
                                                            child: Padding(
                                                              padding: EdgeInsets.all(screenWidth * 0.02),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Colors.blue[50],
                                                                  borderRadius: BorderRadius.circular(4),
                                                                ),
                                                                padding: EdgeInsets.symmetric(
                                                                  horizontal: screenWidth * 0.04,
                                                                  vertical: screenHeight * 0.015,
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      height: screenHeight * 0.04,
                                                                      width: screenHeight * 0.04,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        borderRadius: BorderRadius.circular(90),
                                                                      ),
                                                                      child: Icon(
                                                                        Remix.file_pdf_2_line,
                                                                        color: Colors.grey,
                                                                        size: screenWidth * 0.06,
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: screenWidth * 0.02),
                                                                    Flexible(
                                                                      child: Text(
                                                                        "Share as PDF",
                                                                        style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: screenWidth * 0.035,
                                                                        ),
                                                                        overflow: TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      // Checkbox Row for Default Selection
                                                      Padding(
                                                        padding: EdgeInsets.only(top: screenHeight * 0.015),
                                                        child: Row(
                                                          children: [
                                                            Checkbox(
                                                              value: false,
                                                              onChanged: (bool? value) {},
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  "Make this as default",
                                                                  style: TextStyle(fontSize: screenWidth * 0.04),
                                                                ),
                                                                Text(
                                                                  "To change later go to transaction settings*",
                                                                  style: TextStyle(
                                                                    fontSize: screenWidth * 0.03,
                                                                    color: Colors.grey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child:Icon(
                                           Remix.share_forward_line,
                                            color: Colors.grey,
                                            size: MediaQuery.of(context).size.width * 0.06, // Responsive icon size
                                          ),
                                        ),

                                        GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                backgroundColor: Colors.white,
                                                context: context,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                                ),
                                                builder: (context) {
                                                  return Container(
                                                    height: MediaQuery.of(context).size.height * 0.25,
                                                    child: Column(
                                                      children: [
                                                        // Header with "More Options" and Close Button
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                "More Options",
                                                                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                                              ),
                                                              IconButton(
                                                                onPressed: () {
                                                                  Navigator.pop(context); // Close the bottom sheet
                                                                },
                                                                icon: Icon(Icons.close),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(height: 1, thickness: 0.5),
                                                        ListTile(
                                                          title: Text("Duplicate"),
                                                          onTap: () {
                                                            Navigator.pop(context);
                                                          },
                                                        ),
                                                        Divider(height: 1, thickness: 0.5),
                                                        ListTile(
                                                          title: Text("Delete"),
                                                          onTap: () {
                                                            Navigator.pop(context);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child:Icon(Remix.more_2_line)
                                        ),
                                      ],
                                    ),
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

              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(14),
                            backgroundColor: Colors.blueAccent,
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment_in()));
                          },
                          child:
                              Text(
                                "Take Payment",
                                style: TextStyle(color: Colors.white),
                              ),
                        ),
                      ),
                     SizedBox(width: 10,),
                     Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent,width: 1),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: Icon(Remix.add_line,size: 40,color: Colors.blueAccent,),
                        ),
                      SizedBox(width: 10,),
                  
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(14),
                            backgroundColor: Color(0xFFE03537),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_new_Sales()));
                          },
                          child:
                          Text(
                            "Add Sale",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
