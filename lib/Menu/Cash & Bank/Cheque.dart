import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:demo/Menu/Cash%20&%20Bank/Transfer_Cheque.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class ChequeScreen extends StatefulWidget {
  @override
  _ChequeScreenState createState() => _ChequeScreenState();
}

class _ChequeScreenState extends State<ChequeScreen> {

  String selected_button = "All";
  int value = 0;

  String sort_by = "Date";

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text("Cheque",style: TextStyle(color: Colors.black,fontSize: 18),),
        bottom: Prefered_underline_appbar(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter Buttons
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Choose to view",style: TextStyle(fontSize: 14,),),
                    Row(
                      children: [
                        Text("Sort by : "),
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              backgroundColor: Colors.white,
                              context: context,
                              builder:(context){
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                child: Column(
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Sort by",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                            IconButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(Remix.close_line)
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(color: Colors.grey.shade200,thickness: 1,),


                                      ListTile(
                                        onTap: (){
                                          setState(() {
                                            sort_by = "Date";
                                          });
                                          Navigator.pop(context);
                                        },
                                        dense: true,
                                        visualDensity: VisualDensity.compact,
                                        leading: Icon(Remix.calendar_2_line,color: Colors.blueAccent,),
                                        trailing:sort_by=="Date"?Container(height: 10,width: 10,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(90)),):null,
                                        title: Text("Date"),
                                      ),
                                      Divider(color: Colors.grey.shade200,thickness: 1,),

                                      ListTile(
                                        onTap: (){
                                          setState(() {
                                            sort_by = "Amount";
                                          });
                                          Navigator.pop(context);
                                        },
                                        dense: true,
                                        visualDensity: VisualDensity.compact,
                                        leading: Icon(Icons.currency_rupee,color: Colors.blueAccent,),
                                        trailing:sort_by=="Amount"?Container(height: 10,width: 10,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(90)),):null,
                                        title: Text("Amount"),
                                      ),

                                    ],
                                  ),
                              );
                            });
                          },
                          child: Row(
                            children: [
                              Text("${sort_by}",style: TextStyle(color: Colors.blueAccent),),
                              Icon(Remix.arrow_down_s_line,color: Colors.blueAccent,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
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
                    SizedBox(width: screenwidth*0.02,),
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
                    SizedBox(width: screenwidth*0.02,),
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
              ],
            ),
          ),
          Divider(thickness: 1),

          // Cheque Details
          Expanded(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context,index){
                 return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Bank Icon (Placeholder)
                          Container(
                            color: Colors.blue.shade50,
                            child:Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                              child: Row(
                                children: [
                                  Icon(Remix.bank_line, color: Colors.blue, size: 20),
                                  SizedBox(width: 8),
                                  Container(
                                    width: screenwidth * 0.4,
                                    height: 10,
                                    color: Colors.blue.shade100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
            
                          // Name & Status
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Mohit",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.orange.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  child: Text(
                                    "OPEN",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange.shade500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
            
                          // Amount Field
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Text("Amount",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue.shade100,width: 2)
                                    ),
                                    child: Text("₹ 300.00 /",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
            
                          // Date & Type
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "05/03/2025",
                                      style: TextStyle(color: Colors.grey, fontSize: 14),
                                    ),
                                    Text(
                                      "Payment-in",
                                      style: TextStyle(color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Transfer_Cheque()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      "Deposit",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 12),
            
                          // Deposit Button
                          SizedBox(height: 16),
            
                          // Reference Number
                          Container(
                            color: Colors.blue.shade50,
                            child: Center(
                              child: Text(
                                "R e f e r e n c e  N o . -  N / R",
                                style: TextStyle(color: Colors.grey, letterSpacing: 1.2),
                              ),
                            ),
                          ),
                        ],
                    );
                }
            ),
          ),
        ],
      ),
    );
  }
}