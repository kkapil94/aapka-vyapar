import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';


class Cash_Flow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Cash_Flow();
}

class _Cash_Flow extends State<Cash_Flow>  with SingleTickerProviderStateMixin{
  var time = DateTime.now();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _selectedDuration = 'Select Duration';
  void _showTimeDurationBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('One Day'),
                onTap: () {
                  setState(() {
                    _selectedDuration = 'One Day';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('One Week'),
                onTap: () {
                  setState(() {
                    _selectedDuration = 'One Week';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('One Month'),
                onTap: () {
                  setState(() {
                    _selectedDuration = 'One Month';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('One Year'),
                onTap: () {
                  setState(() {
                    _selectedDuration = 'One Year';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Color? blue_50 = Colors.blue[50];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: Prefered_underline_appbar(),
        foregroundColor: Colors.black,
        title: Text('Cashflow Report', style: TextStyle(color: Colors.black)),
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
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: _showTimeDurationBottomSheet,
                            child: Row(
                              children: [
                                Text(_selectedDuration,),
                                SizedBox(width: 10,),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                          VerticalDivider(thickness: 1,),
                          Row(
                            children: [
                              Icon(FlutterRemix.calendar_2_line,size: 16,color: Colors.blue,),
                              SizedBox(width: 10,),
                              Text("Date", style: TextStyle(fontSize: 16)),
                              TextButton(
                                onPressed: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  if (selectedDate != null) {
                                    setState(() {
                                      time = selectedDate;
                                    });
                                  }
                                },
                                child: Text(
                                  "${time.day}/${time.month}/${time.year}",
                                  style: TextStyle(fontSize: 16,),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey,thickness: 0.8,),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text("Filters Applied :")
                              ),
                              SizedBox(
                                height: 30,
                                child: Center(
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
                                          Text("Filters",style: TextStyle(color: Colors.black,fontSize: 12),)
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.grey.shade200,
                                      ),
                                      onPressed: (){},
                                      child: Center(child: Text("0 value Txns-Show",style: TextStyle(fontSize: 11,color: Colors.black),))
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.grey.shade200,
                                      ),
                                      onPressed: (){},
                                      child: Center(child: Text("Opening/Closing Cash - Consider",style: TextStyle(fontSize: 11,color: Colors.black),))
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),


                  ],
                ),
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [Colors.blue.shade100,Colors.blue.shade50]
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
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children:[
                                  Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                    Text("Closing Cash",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.grey),),
                                    Text("₹ 93,220",style: TextStyle(color: Color(0xFF38C782)),),
                                  ],
                                ),
                                  Text(" = ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.grey)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Opening Cash",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.grey),),
                                      Text("₹ 93,220",style: TextStyle(color: Color(0xFF38C782)),),
                                    ],
                                  ),
                                  Text(" + ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.grey)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Closing Cash",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.grey),),
                                      Text("₹ 93,220",style: TextStyle(color: Color(0xFF38C782)),),
                                    ],
                                  ),
                                  Text(" - ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.grey)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Money Out",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.grey),),
                                      Text("₹ 93,220",style: TextStyle(color: Color(0xFFE03537)),),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    TabBar(
                                      controller: _tabController,
                                      labelColor: Colors.red,
                                      unselectedLabelColor: Colors.black,
                                      indicatorColor: Colors.red,
                                      tabs: const [
                                        Tab(text: "Money In"),
                                        Tab(text: "Money Out"),
                                      ],
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: TabBarView(
                                          controller: _tabController,
                                          children: [
                                            _money_in(),
                                            _money_out(),
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
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _tabController.index == 0 ? "Total Money In" : "Total Money Out",
              style: TextStyle(color: _tabController.index == 0 ?Color(0xFF38C782):Color(0xFFE03537), fontSize: 14),
            ),
            Text(
              _tabController.index == 0 ? "+ 500" : "- 500",
              style: TextStyle(color: _tabController.index == 0 ?Color(0xFF38C782):Color(0xFFE03537), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
  Widget _money_in() {
    return ListView.builder(
      itemCount: 5, // Sample transactions
      itemBuilder: (context, index) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ashish",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("02 FEB, 25", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Text("Payment-in", style: TextStyle(color: Colors.grey)),
                  Text(
                    "₹ 900",
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade200),
          ],
        );
      },
    );
  }
  Widget _money_out() {
    return ListView.builder(
      itemCount: 5, // Sample transactions
      itemBuilder: (context, index) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ashish",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("02 FEB, 25", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Text("Payment-in", style: TextStyle(color: Colors.grey)),
                  Text(
                    "₹ 900",
                    style: TextStyle(color: Color(0xFFE03537), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade200),
          ],
        );
      },
    );
  }

}
