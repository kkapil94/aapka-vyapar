import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:demo/Items/ItemDetails/adjustStock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String itemName;
  final double salePrice;
  final double purchasePrice;
  final double inStock;

  const ItemDetailsScreen({
    Key? key,
    required this.itemName,
    required this.salePrice,
    required this.purchasePrice,
    required this.inStock,
  }) : super(key: key);

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
        backgroundColor: Colors.white,
        title:Text(
          "Item Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: Prefered_underline_appbar(),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    itemName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sale Price", style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                          SizedBox(height: 4),
                          Text("₹ ${salePrice.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Purchase Price", style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                          SizedBox(height: 4),
                          Text("₹ ${purchasePrice.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("In stock", style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                          SizedBox(height: 4),
                          Text("${inStock.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF38C782))),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Stock Value", style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                          const SizedBox(height: 4),
                          Text("₹ ${(inStock * purchasePrice).toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                Container(
                  color: Colors.grey.shade100,
                  width: double.infinity,
                  padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stock Transactions",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(child: Text("Transactions", style: TextStyle(fontSize: 14, color: Colors.grey.shade500))),
                          Expanded(child: Text("Quantity", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.grey.shade500))),
                          Expanded(child: Text("Total Amount", textAlign: TextAlign.end, style: TextStyle(fontSize: 14, color: Colors.grey.shade500))),
                        ],
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Add Stock", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            Text("14/02/2025", style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
                          ],
                        ),
                      ),
                      Expanded(child: Text("50", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                      Expanded(child: Text("₹ 4,400.00", textAlign: TextAlign.end, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                    ],
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
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AdjustStockScreen(itemName: 'Maggie',)));
                  },
                  child:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 8),
                      Text(
                        "Adjust Stock",
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
