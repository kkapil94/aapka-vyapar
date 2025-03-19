import 'package:demo/Home/Home.dart';
import 'package:demo/Items/ItemDetails/itemDetails.dart';
import 'package:demo/Items/MyStorePage/myStore.dart';
import 'package:demo/Items/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:remixicon/remixicon.dart';

// Items Page Content
class ItemsPageContent extends StatelessWidget {
  const ItemsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Quick Links Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, bottom: 7),
                      child: Text(
                        "Quick Links",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Add Txn
                      QuickLink(
                        icon: Remix.store_2_line,
                        label: "Online Store",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnlineStoreScreen()),
                          );
                        },
                      ),
                      //Sale Report
                      QuickLink(
                        icon: FlutterRemix.funds_line,
                        label: "Stock Summary",
                        onTap: () {

                        },
                      ),
                      //Txn settings
                      QuickLink(
                        icon: Remix.settings_2_line,
                        label: "Txn Settings",
                        iconColor: Colors.red,
                        onTap: (){

                        },
                      ),
                      //Show all
                      QuickLink(
                        icon: FlutterRemix.arrow_right_circle_line,
                        label: "Show All",
                        onTap: () {
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),


            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for transaction",
                          hintStyle:
                          TextStyle(fontSize: 13, color: Colors.grey),
                          prefixIcon: Icon(
                            FlutterRemix.search_line,
                            color: Colors.blue,
                          ),
                          suffixIcon:Icon(FlutterRemix.filter_2_line, color: Colors.blue,),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 40,
                    width: 40,
                    child: IconButton(onPressed: (){}, icon: Icon(Remix.more_2_line)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),

            // Item
            Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder:(context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailsScreen(itemName: "Patoto", salePrice: 1200, purchasePrice: 300, inStock: 10)));
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cofee",style: TextStyle(fontSize: 16),),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Text("GROCERY",style: TextStyle(fontSize: 11),),
                                    ),
                                    IconButton(onPressed: (){}, icon: Icon(Remix.share_forward_line,)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Sale Price", style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                                      SizedBox(height: 4),
                                      Text("₹ 100.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Purchase Price", style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                                      SizedBox(height: 4),
                                      Text("₹ 200.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("In stock", style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                                      SizedBox(height: 4),
                                      Text("200.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF38C782))),
                                    ],
                                  ),
                                ],
                              ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }

}
