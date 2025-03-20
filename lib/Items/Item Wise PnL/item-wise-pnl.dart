import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemWiseProfitLossScreen extends StatefulWidget {
  const ItemWiseProfitLossScreen({Key? key}) : super(key: key);

  @override
  State<ItemWiseProfitLossScreen> createState() =>
      _ItemWiseProfitLossScreenState();
}

class _ItemWiseProfitLossScreenState extends State<ItemWiseProfitLossScreen> {
  // Sample data
  final List<Map<String, dynamic>> items = [
    {'name': 'Maggi', 'profit': 0.00},
    {'name': 'Patanjali Aloe Vera Juice 1 Ltr', 'profit': 0.00},
    {'name': 'Patanjali Badam 500 Gm Jar', 'profit': 7500.00},
    {'name': 'Patato', 'profit': 20.00},
    {'name': 'Rice', 'profit': 0.00},
  ];

  String timeRange = "This month";
  String dateRange = "01/02/2025 to 28/02/2025";
  bool showOnlySaleItems = false;
  String sortBy = "Name";
  double totalProfit = 11920.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0288D1),
        title: const Text('Item wise Profit & Loss',
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Date Filter Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFFF5F5F5),
            child: Row(
              children: [
                Text(
                  timeRange,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child:
                          const Icon(Icons.calendar_today, color: Colors.blue),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      dateRange,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Filter Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: showOnlySaleItems,
                  onChanged: (value) {
                    setState(() {
                      showOnlySaleItems = value ?? false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const Text(
                  'Items having sale',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      'Sort by : ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      sortBy,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ],
            ),
          ),

          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    'Item name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Profit/Loss Amount',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),

          // List of Items
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          '₹ ${item['profit'].toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            color: item['profit'] > 0
                                ? Colors.green
                                : Colors.black,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Total Footer
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
            child: Row(
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '₹ ${totalProfit.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
