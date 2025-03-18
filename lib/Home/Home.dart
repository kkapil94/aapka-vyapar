
import 'package:aapka_vyapar/Home/Add%20Txn/Other%20Transaction/Expenses.dart';
import 'package:aapka_vyapar/Home/Add%20Txn/Purchase%20Transaction/Payment_Out.dart';
import 'package:aapka_vyapar/Home/Add%20Txn/Purchase%20Transaction/Purchase_Order.dart';
import 'package:aapka_vyapar/Home/Add%20Txn/Purchase%20Transaction/Purchase_Return.dart';
import 'package:aapka_vyapar/Home/Add%20Txn/Purchase%20Transaction/purchase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:remixicon/remixicon.dart';

import 'Add Txn/Sale Transaction/Delivery_Challan.dart';
import 'Add Txn/Sale Transaction/Estimate_Quotation.dart';
import 'Add Txn/Sale Transaction/Sale_Invoice.dart';
import 'Add Txn/Sale Transaction/Sale_Order.dart';
import 'Add Txn/Sale Transaction/Sale_Return.dart';
import 'Add Txn/Sale Transaction/payment-in.dart';
import 'add_new_sales.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea( // Wrap with SafeArea to handle status bar
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          backgroundColor: Colors.white, // White background to match the design
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: TabBar(
              labelColor: Color(0xFFC41E3A),
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                color: Color(0xFFFADBD8),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(0xFFC41E3A)), // Red border
              ),
              indicatorPadding: EdgeInsets.symmetric(vertical: 8.0), // Align the indicator vertically
              overlayColor: MaterialStateProperty.all(Colors.transparent), // Remove ripple effect
              tabs: [
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Transaction Details",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Party Details",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TransactionDetailsTab(),
              PartyDetailsTab(),
            ],
          ),
        ),
      ),
    );
  }
}

const default_color = Color(0xFFACC7DFFF);


class TransactionDetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding:EdgeInsets.only(top: 8.0,),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35,bottom: 7),
                      child: Text(
                        "Quick Links",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickLink(
                        icon: FlutterRemix.file_add_line,
                        backgroundColor: Colors.redAccent,
                        label: "Add Txn",
                        onTap: () {
                          pop_up_modal(context);
                        },
                      ),
                      QuickLink(
                        icon: Icons.local_offer,
                        label: "60% OFF",
                        backgroundColor: Colors.yellow.shade700,
                        iconColor: Colors.red,
                      ),
                      QuickLink(
                        icon: FlutterRemix.file_chart_line,
                        label: "Sale Report",
                        backgroundColor: Colors.lightBlue,
                      ),
                      QuickLink(
                        icon: FlutterRemix.arrow_right_circle_line,
                        label: "Show All",
                        backgroundColor: Colors.lightBlue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Add_new_Sales()),
                    );
                  },
                  child: SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.currency_rupee, color: Colors.white),
                        ),
                        const Text(
                          "Add New Sale",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class QuickLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  static const default_color = Color(0xFFACC7DFFF);
  const QuickLink({
    Key? key,
    required this.icon,
    required this.label,
    this.backgroundColor = default_color,
    this.iconColor = Colors.white,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 100, // Fix item height to a consistent value
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 60,
                  height: 40,
                ),
                Positioned(
                  top: -2,
                  child: Icon(
                    icon,
                    size: 30,
                  ),
                ),
                Positioned(
                  top: 25,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12,),
            ),
          ],
        ),
      ),
    );
  }
}


  var iconOf_SaleTransaction = [
    FlutterRemix.download_cloud_2_line,
    FlutterRemix.arrow_up_line,
    FlutterRemix.truck_line,
    FlutterRemix.calculator_line,
    FlutterRemix.money_dollar_box_line,
    FlutterRemix.shape_2_line,
    Remix.discount_percent_line,
  ];
  var labelOf_SaleTransaction = [
    "Payment-In",
    "Sale Return",
    "Delivery Challan",
    "Estimate/Quotation",
    "Proforma Invoice",
    "Sale Order",
    "Sale Invoice"
  ];

  var iconOf_PurchaseTransaction = [
    FlutterRemix.shopping_cart_2_line,
    FlutterRemix.money_cny_box_line,
    FlutterRemix.secure_payment_line,
    FlutterRemix.shopping_bag_2_line,
  ];
  var labelOf_PurchaseTransaction = [
    "Purchase",
    "Payment-Out",
    "Purchase Return",
    "Purchase Order",
  ];
  var iconOf_OtherTransaction = [
    FlutterRemix.wallet_3_line,
    Remix.p2p_line,
  ];
  var labelOf_OtherTransaction = [
    "Expenses",
    "P2P Transfer",
  ];


void pop_up_modal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        color: Colors.white,
        child: FractionallySizedBox(
          heightFactor: 0.80, // 95% of the screen height
          child: Padding(
            padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sale Transactions Header
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0,top: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Sale Transactions",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                    // Sale Transactions Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {

                        return InkWell(
                          onTap: (){
                            if(index==0){
                              Navigator.push(context, MaterialPageRoute(builder: (builder){return Payment_in();}));
                            }
                            if(index==1){
                              Navigator.push(context, MaterialPageRoute(builder: (builder)=>Sale_Return()));
                            }
                            if(index==2){
                              Navigator.push(context, MaterialPageRoute(builder: (builder)=>Delivery_Challan()));
                            }
                            if(index==3 || index==4){
                              Navigator.push(context, MaterialPageRoute(builder: (builder)=>Estimate_Quotation()));
                            }
                            if(index==5){
                              Navigator.push(context, MaterialPageRoute(builder: (builder)=>Sale_Order()));
                            }
                            if(index==6){
                              Navigator.push(context, MaterialPageRoute(builder: (builder)=>Sale_Invoice()));
                            }
                          },
                          child: QuickLink(
                            icon: iconOf_SaleTransaction[index],
                            label: labelOf_SaleTransaction[index],
                            backgroundColor: index == 0 ? Color(0XFF90D5FF) : default_color,
                          ),
                        );
                      },
                      itemCount: iconOf_SaleTransaction.length,
                    ),

                    // Purchase Transactions Header
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0,top: 8.0),
                      child: Text(
                        "Purchase Transactions",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Purchase Transactions Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            if(index==0){
                              Navigator.push(context, MaterialPageRoute(builder: (builder){return Purchase();}));
                            }
                            if(index==1){
                              Navigator.push(context, MaterialPageRoute(builder: (builder){return Payment_Out();}));
                            }
                            if(index==2){
                              Navigator.push(context, MaterialPageRoute(builder: (builder){return Purchase_Return();}));
                            }
                            if(index==3){
                              Navigator.push(context, MaterialPageRoute(builder: (builder){return Purchase_Order();}));
                            }
                          },
                          child: QuickLink(
                            icon: iconOf_PurchaseTransaction[index],
                            label: labelOf_PurchaseTransaction[index],
                            backgroundColor: index == 0 ? Color(0XFF90D5FF) : default_color,

                          ),
                        );
                      },
                      itemCount: iconOf_PurchaseTransaction.length,
                    ),

                    // Other Transactions Header
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0,top: 8.0),
                      child: Text(
                        "Other Transactions",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Other Transactions Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            if(index==0){
                              Navigator.push(context, MaterialPageRoute(builder: (builder){return Expenses();}));
                            }
                          },
                          child: QuickLink(
                            icon: iconOf_OtherTransaction[index],
                            label: labelOf_OtherTransaction[index],
                            backgroundColor: index == 0 ? Color(0XFF90D5FF) : default_color,
                          ),
                        );
                      },
                      itemCount: iconOf_OtherTransaction.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
      );
    },
  );
}

  class PartyDetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding:EdgeInsets.only(top: 8.0,bottom: 8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35,bottom: 7),
                      child: Text(
                        "Quick Links",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickLink(
                        icon: FlutterRemix.account_box_line,
                        label: "Import Party",
                        iconColor: Colors.red,
                      ),
                      QuickLink(
                        icon: FlutterRemix.contacts_line,
                        label: "Party Statement",
                        onTap: () {
                          pop_up_modal(context);
                        },
                      ),
                      QuickLink(
                        icon: FlutterRemix.settings_2_line,
                        label: "Party settings",
                      ),
                      QuickLink(
                        icon: FlutterRemix.arrow_right_circle_line,
                        label: "Show All",
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}



// class QuickLink extends StatelessWidget {
//   final IconData icon;
//   final String label;
//
//   QuickLink({required this.icon, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CircleAvatar(
//           backgroundColor: Colors.blue.shade100,
//           child: Icon(icon, color: Colors.blue),
//         ),
//         SizedBox(height: 5),
//         Text(
//           label,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 12),
//         ),
//       ],
//     );
//   }
// }

      
