import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

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
                          });
                        },
                        child: _buildSectionHeader("Sale", Remix.discount_percent_line, isSaleExpanded),
                      ),

                      if (isSaleExpanded) ...[
                        _buildMenuItem("Sale Invoice",(){}),
                        _buildMenuItem("Payment-In",(){}),
                        _buildMenuItem("Sale Return (Credit Note)",(){}),
                        _buildMenuItem("Estimate/Quotation (Proforma Invoice)",(){}),
                        _buildMenuItem("Sale Order",(){}),
                        _buildMenuItem("Delivery Challan",(){}),
                      ],

                      Divider(),

                      // Purchase Section
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPurchaseExpanded = !isPurchaseExpanded;
                          });
                        },
                        child: _buildSectionHeader("Purchase", Remix.shopping_cart_2_line, isPurchaseExpanded),
                      ),

                      if (isPurchaseExpanded) ...[
                        _buildMenuItem("Purchase Invoice",(){}),
                        _buildMenuItem("Payment-Out",(){}),
                        _buildMenuItem("Purchase Order",(){}),
                      ],

                      Divider(),

                      // Expenses
                      _buildMenuItemWithIcon("Expenses", Icons.receipt_long),

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
                        _buildMenuItem("Orders",(){}),
                        _buildMenuItem("Stock Management",(){}),
                      ],

                      Divider(),

                      // Reports
                      _buildMenuItemWithIcon("Reports", Icons.bar_chart),
                    ],
                  ),
                ),

              ],
            ),
          ),
       ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, bool isExpanded) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical:4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20),
              SizedBox(width: 10),
              Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ],
          ),
          Icon(isExpanded ? Remix.arrow_up_s_line : Remix.arrow_down_s_line, size: 25,color: Colors.blueAccent,),
        ],
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

  Widget _buildMenuItemWithIcon(String title, IconData icon) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      visualDensity: VisualDensity.compact,
      trailing: Icon(Remix.arrow_right_s_line, size:25,color: Colors.blueAccent,),
      leading: Icon(icon, size: 20, color: Colors.black),
      title: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      onTap: () {},
    );
  }
}
