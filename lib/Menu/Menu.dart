import 'package:demo/Dashboard/Bank/Bank_account_list.dart';
import 'package:demo/Dashboard/Cah_in_Hand.dart';
import 'package:demo/Dashboard/Expense/Expense.dart';
import 'package:demo/Home/Transaction%20Details/Show%20All/all_transaction.dart';
import 'package:demo/Items/Online%20Store/Manage%20Items%20Screen/manage-items-screen.dart';
import 'package:demo/Items/Online%20Store/MyStorePage/myStore.dart';
import 'package:demo/Items/Online%20Store/OrderScreen/OrderScreen.dart';
import 'package:demo/Menu/Cash%20&%20Bank/Cheque.dart';
import 'package:demo/Menu/My%20business/Purchase/Purchase_List.dart';
import 'package:demo/Menu/My%20business/Purchase/Purchase_Order.dart';
import 'package:demo/Menu/My%20business/Purchase/Purchase_Return_Report.dart';
import 'package:demo/Menu/My%20business/Report/report.dart';
import 'package:demo/Menu/My%20business/Sale/Delivery_Challan_Details.dart';
import 'package:demo/Menu/My%20business/Sale/Estimate_Details.dart';
import 'package:demo/Menu/My%20business/Sale/Sale_Return_Report.dart';
import 'package:demo/Menu/My%20business/Sale/Sale_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import 'Manage Componies/Manage_Compony.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  bool isSaleExpanded = false;
  bool isPurchaseExpanded = false;
  bool isStoreExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // My Business Header
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "My Business",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Divider(),

                      // Sale Section
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSaleExpanded = !isSaleExpanded;
                            isPurchaseExpanded = false;
                            isStoreExpanded = false;
                          });
                        },
                        child: _buildSectionHeader("Sale", Remix.discount_percent_line, isSaleExpanded),
                      ),
                      if (isSaleExpanded) ...[
                        _buildMenuItem("Sale Invoice",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Sale_List()));}),
                        _buildMenuItem("Payment-In",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Transaction()));}),
                        _buildMenuItem("Sale Return (Credit Note)",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Sale_Return_Report()));}),
                        _buildMenuItem("Estimate/Quotation (Proforma Invoice)",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Estimate_Details()));}),
                        _buildMenuItem("Sale Order",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersScreen()));}),
                        _buildMenuItem("Delivery Challan",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Delivery_Challan_Details()));}),
                      ],
                      Divider(),

                      // Purchase Section
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPurchaseExpanded = !isPurchaseExpanded;
                            isSaleExpanded = false;
                            isStoreExpanded = false;
                          });
                        },
                        child: _buildSectionHeader("Purchase", Remix.shopping_cart_2_line, isPurchaseExpanded),
                      ),
                      if (isPurchaseExpanded) ...[
                        _buildMenuItem("Purchase Bills",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Purchase_List()));}),
                        _buildMenuItem("Payment-Out",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Transaction()));}),
                        _buildMenuItem("Purchase Return (Debit Note)",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Purchase_Return_Report()));}),
                        _buildMenuItem("Purchase Order",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Purchase_Order_menu()));}),

                      ],
                      Divider(),

                      // Expenses
                      _buildMenuItemWithIcon("Expenses", Icons.receipt_long,(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Expense()));}),
                      Divider(),

                      
                      // My Online Store
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isStoreExpanded = !isStoreExpanded;
                          });
                        },
                        child: _buildSectionHeader("My Online Store", Icons.storefront, isStoreExpanded),
                      ),
                      if (isStoreExpanded) ...[
                        _buildMenuItem("Dashboard",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>OnlineStoreScreen()));}),
                        _buildMenuItem("Manage Items",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageItemsPage()));}),
                        _buildMenuItem("Manage Orders",(){Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersScreen()));}),
                        _buildMenuItem("Store Reporting",(){}),
                      ],
                      Divider(),

                      // Reports
                      _buildMenuItemWithIcon("Reports", Icons.bar_chart,(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Report()));}),
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                //cash and bank
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Cash & Bank",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Divider(),
                      _buildMenuItemWithIcon("Bank Accounts", Remix.bank_line,(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Bank_Account_List()));}),
                      _buildMenuItemWithIcon("Cash In-Hand",Remix.hand_coin_line,(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Cash_In_Hand()));}),
                      _buildMenuItemWithIcon("Cheque", Remix.stack_line,(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChequeScreen()));}),
                      
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Import Utilities",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Divider(),
                      _buildMenuItemWithIcon("Manage Componies", Remix.command_line,(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Manage_Compony()));}),

                    ],
                  ),
                ),
                SizedBox(height: 10,),


                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Others",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Divider(),
                      _buildMenuItemWithIcon("Settings", Remix.settings_2_line,(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Manage_Compony()));}),
                      _buildMenuItemWithIcon("Rate this app", Remix.sparkling_line,(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Manage_Compony()));}),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
       ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, bool isExpanded) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,),
      child: ListTile(
              dense: true,
             visualDensity: VisualDensity.compact,
             contentPadding: EdgeInsets.zero,
             leading:  Icon(icon, size: 20),
             title: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            trailing: Icon(isExpanded ? Remix.arrow_up_s_line : Remix.arrow_down_s_line, size: 25,color: Colors.blueAccent,) ,
          ),
    );
  }

  Widget _buildMenuItem(String title,VoidCallback callback) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 12.0),
      child: ListTile(
        onTap:callback,
        dense: true,
        contentPadding: EdgeInsets.zero,
        visualDensity:VisualDensity.compact,
        title: Text(title, style: TextStyle(fontSize: 14)),
        trailing: Icon(Remix.arrow_right_s_line, size: 25, color: Colors.grey),
      ),
    );
  }

  Widget _buildMenuItemWithIcon(String title, IconData icon,VoidCallback callback) {
    return ListTile(
      onTap: callback,
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      visualDensity: VisualDensity.compact,
      trailing: Icon(Remix.arrow_right_s_line, size:25,color: Colors.blueAccent,),
      leading: Icon(icon, size: 20, color: Colors.black),
      title: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
    );
  }
}
