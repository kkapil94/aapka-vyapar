import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:remixicon/remixicon.dart';


class Low_Stock_Summary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Low_Stock_Summary();
}

class _Low_Stock_Summary extends State<Low_Stock_Summary> {
  var firstDate = DateTime.now();
  var lastDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  void _select_firstDate(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.monthsPerYear),
      lastDate: DateTime(2030),
    ).then((picked) {
      if (picked != null) {
        setState(() {
          firstDate = picked;
        });
      }
    });
  }
  void _select_lastDate(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((picked) {
      if (picked != null) {
        setState(() {
          lastDate = picked;
        });
      }
    });
  }

  String? selected_timeDuration = "This week";
  final List<String> time_duration_option = [
    'Today',
    'This week',
    'This month',
    'This quarter',
    'This Financial Year',
    'Custom'
  ];

  void _showTimeSelectionModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height*0.48,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),
              ListView.separated(
                shrinkWrap: true,
                itemCount: time_duration_option.length,
                separatorBuilder: (BuildContext context,int index){
                  return Divider(color: Colors.grey.shade200,thickness: 1,);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    title: Text(time_duration_option[index]),
                    trailing: selected_timeDuration == time_duration_option[index]
                        ? Icon(Icons.circle, color: Colors.blue, size: 12)
                        : null,
                    onTap: () {
                      setState(() {
                        selected_timeDuration = time_duration_option[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: Prefered_underline_appbar(),
        foregroundColor: Colors.black,
        title: Text("Low Stock Summary", style: TextStyle(color: Colors.black)),
        actions: [
          Container(
            height: 25,
            width: 25,
            child: Image.asset("Assets/Images/pdf.png"),
          ),
          Container(
            height: 30,
            width: 50,
            child: Image.asset("Assets/Images/xls.png"),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.white,
              child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text("Filters Applied :")
                            ),
                            SizedBox(
                              height: 32,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    side: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: Row(
                                    children: [
                                      Icon(FlutterRemix.filter_2_line,size: 15,color: Colors.blue,),
                                      Text("Filters",style: TextStyle(color: Colors.black,fontSize: 13),)
                                    ],
                                  )),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 30,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey.shade200,
                                    ),
                                    onPressed: (){},
                                    child: Center(child: Text("Item Category - All",style: TextStyle(fontSize: 11,color: Colors.black),))
                                ),
                              ),
                              SizedBox(width: 10,),
                              SizedBox(
                                height: 30,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey.shade200,
                                    ),
                                    onPressed: (){},
                                    child: Center(child: Text("Stock - ALl",style: TextStyle(fontSize: 11,color: Colors.black),))
                                ),
                              ),
                              SizedBox(width: 10,),
                              SizedBox(
                                height: 30,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey.shade200,
                                    ),
                                    onPressed: (){},
                                    child: Center(child: Text("Status - ALl",style: TextStyle(fontSize: 11,color: Colors.black),))
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
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [Colors.blue.shade200,Colors.blue.shade50]
                    )
                ),
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Low Stock Items",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                Text("1",style: TextStyle(color: Color(0xFFE03537)),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Stock Value",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                Text("₹ 300.00",style: TextStyle(fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Maggie",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                            Container(
                                              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                              child: Text("GROCERY",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.55,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Stock Value :",style: TextStyle(fontSize: 13)),
                                                  Text("₹ 0.00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text("Stock Qty :",style: TextStyle(fontSize: 13)),
                                                  Text(" 1.0",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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