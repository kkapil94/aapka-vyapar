import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDetailsPnL extends StatefulWidget {
  const ItemDetailsPnL({Key? key}) : super(key: key);

  @override
  State<ItemDetailsPnL> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsPnL> {
  bool hideInactiveDates = false;
  String selectedPeriod = "This month";
  DateTime startDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime endDate = DateTime.now();
  String itemName = "";

  // Generate dummy data for the table
  List<Map<String, dynamic>> generateDailyData() {
    List<Map<String, dynamic>> data = [];

    // Starting from February 1st to generate the dates as in the screenshot
    DateTime currentDate = DateTime(2025, 2, 0);

    for (int i = 0; i < 28; i++) {
      currentDate = currentDate.add(const Duration(days: 1));
      data.add({
        "date": currentDate,
        "saleQty": 0.0,
        "purchaseQty": 0.0,
        "adjustQty": 0.0,
        "closingQty": 0.0,
      });
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    final dailyData = generateDailyData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Item wise Profit & Lo...",
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                // Date filter dropdown
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedPeriod,
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down),
                              items: [
                                'This month',
                                'Last month',
                                'Custom range'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedPeriod = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  color: Colors.blue),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  "21/03/2025 to 21/03/2025",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Hide inactive dates checkbox
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: hideInactiveDates,
                        onChanged: (value) {
                          setState(() {
                            hideInactiveDates = value!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Text(
                        "Hide inactive dates",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Warning banner on the right
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Item Name",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Enter Name",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1.5),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Table header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    "Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Sale qty",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Purchase qty",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Adjust qty",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Closing qty",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Table data
          Expanded(
            child: ListView.builder(
              itemCount: dailyData.length,
              itemBuilder: (context, index) {
                final item = dailyData[index];
                final DateFormat formatter = DateFormat('d/MM/yyyy');
                final String formattedDate = formatter.format(item["date"]);

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 4.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          formattedDate,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            item["saleQty"].toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            item["purchaseQty"].toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            item["adjustQty"].toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            item["closingQty"].toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
