import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Stock_Summary_By_Item_Category extends StatefulWidget {
  Stock_Summary_By_Item_Category({super.key});

  @override
  State<Stock_Summary_By_Item_Category> createState() => _Stock_Summary_By_Item_Category();
}

class _Stock_Summary_By_Item_Category extends State<Stock_Summary_By_Item_Category> {

  TextEditingController party_name_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    party_name_controller.text = "All Categories";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Color(0xFF0078AA),
        title: Text("Stock Summary By Item Category",style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Remix.more_2_line)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [

          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Item Category", style: TextStyle(fontSize: 13)),
                Text("Sale Qty", style: TextStyle(fontSize: 13)),
                Text("Purchase Qty", style: TextStyle(fontSize: 13)),
              ],
            ),
          ),

          // Table Rows
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Sample data
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Grocery"),
                          Text("50"),
                          Text("0.0"),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Footer
        ],
      ),
    );
  }
}

