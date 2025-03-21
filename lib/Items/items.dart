import 'package:aapka_vyapar/Items/Add%20New%20Sale/add-new-sale.dart';
import 'package:aapka_vyapar/Items/Export%20%20Items/export-items.dart';
import 'package:aapka_vyapar/Items/Import%20Items/import-items.dart';
import 'package:aapka_vyapar/Items/Item%20PnL%20Details/item-details.dart';
import 'package:aapka_vyapar/Items/Item%20Wise%20PnL/item-wise-pnl.dart';
import 'package:aapka_vyapar/Items/ItemDetails/itemDetails.dart';
import 'package:aapka_vyapar/Items/MyStorePage/myStore.dart';
import 'package:aapka_vyapar/Items/Stock%20Summary/stock_summary.dart';
import 'package:aapka_vyapar/Items/itemCard.dart';
import 'package:flutter/material.dart';

// Items Page Content
class ItemsPageContent extends StatelessWidget {
  const ItemsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Quick Links Section
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Quick Links",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickLinkItem(
                    Icons.store,
                    "Online Store",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnlineStoreScreen()),
                      );
                    },
                  ),
                  _buildQuickLinkItem(
                    Icons.show_chart,
                    "Stock Summary",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StockSummaryScreen()),
                      );
                    },
                  ),
                  _buildQuickLinkItem(Icons.settings, "Txn Settings"),
                  _buildQuickLinkItem(
                    Icons.arrow_forward,
                    "Show All",
                    onTap: () {
                      // Show the bottom sheet when 3-dot button is clicked
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("More Option",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                    IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildGridOption(
                                      Icons.add_box,
                                      "Import Items",
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ImportItemsPage()),
                                        );
                                      },
                                    ),
                                    _buildGridOption(
                                      Icons.indeterminate_check_box,
                                      "Export Items",
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ExportItemsScreen()),
                                        );
                                      },
                                    ),
                                    _buildGridOption(
                                      Icons.bubble_chart,
                                      "Item Wise PnL",
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ItemWiseProfitLossScreen()),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildGridOption(
                                      Icons.view_in_ar,
                                      "Item Details",
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ItemDetailsPnL()),
                                        );
                                      },
                                    ),
                                    _buildGridOption(
                                      Icons.inventory,
                                      "Low Stock Summary",
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StockSummaryScreen()),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                        width:
                                            80), // Empty space for the third column
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.blue),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search for transaction",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Icon(Icons.filter_list, color: Colors.blue),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // Show the bottom sheet when 3-dot button is clicked
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("More Options",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                              Divider(),
                              _buildMenuOption(
                                  "Mark Items Active", Icons.chevron_right),
                              Divider(),
                              _buildMenuOption(
                                  "Mark Items Inactive", Icons.chevron_right),
                              Divider(),
                              _buildToggleOption("Show Inactive"),
                              Divider(),
                              _buildMenuOption("Units", Icons.chevron_right),
                              Divider(),
                              _buildMenuOption(
                                  "Categories", Icons.chevron_right),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Item Card
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              buildItemCard(
                  context, "Cofee", 500.00, 500.00, 500.00, "GROCERY"),
            ],
          ),
        ),

        const Spacer(),

        // Add New Sale Button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddItemScreen()),
              );
            },
            icon: const Icon(Icons.add_box),
            label: const Text("Add New Sale", style: TextStyle(fontSize: 16)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinkItem(IconData icon, String title,
      {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPriceColumn(String label, String price, Color priceColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: priceColor,
          ),
        ),
      ],
    );
  }
}

Widget _buildMenuOption(String title, IconData iconData) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18)),
        Icon(iconData),
      ],
    ),
  );
}

Widget _buildToggleOption(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18)),
        Checkbox(
          value: false,
          onChanged: (bool? value) {
            // Handle checkbox state here
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    ),
  );
}

Widget _buildGridOption(IconData icon, String label,
    {VoidCallback? onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Column(
      children: [
        Container(
          child: Icon(icon, size: 30),
        ),
        Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
