import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Item_Wise_Profit_And_Loss extends StatefulWidget {
  Item_Wise_Profit_And_Loss({super.key});

  @override
  State<Item_Wise_Profit_And_Loss> createState() =>
      _Item_Wise_Profit_And_Loss();
}

class _Item_Wise_Profit_And_Loss extends State<Item_Wise_Profit_And_Loss> {
  var firstDate = DateTime.now();
  var lastDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  void _select_firstDate(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime(2000, 1, 1), // Fixed incorrect firstDate
      lastDate: DateTime(2030),
    ).then((picked) {
      if (picked != null) {
        setState(() {
          firstDate = picked;
          if (lastDate.isBefore(firstDate)) {
            lastDate = firstDate; // Ensure lastDate is always after firstDate
          }
        });
      }
    });
  }

  void _select_lastDate(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: firstDate, // Ensure lastDate is picked after firstDate
      lastDate: DateTime(2030),
    ).then((picked) {
      if (picked != null) {
        setState(() {
          lastDate = picked;
        });
      }
    });
  }

  String? selected_timeDuration = "This week";
  final List<String> time_duration_option = [
    'Today',
    'This week',
    'This month',
    'This quarter',
    'This Financial Year',
    'Custom'
  ];

  void _showTimeSelectionModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.48,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade200, thickness: 1),
              Expanded(
                child: ListView.separated(
                  itemCount: time_duration_option.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: Colors.grey.shade200, thickness: 1);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      title: Text(time_duration_option[index]),
                      trailing: selected_timeDuration == time_duration_option[index]
                          ? Icon(Icons.circle, color: Colors.blue, size: 12)
                          : null,
                      onTap: () {
                        setState(() {
                          selected_timeDuration = time_duration_option[index];
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  String _selectedSortBy = "Name";

  bool is_item_having_sale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0078AA),
        title: Text(
          "Item Wise Profit & Loss",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Remix.more_2_line))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Date Range & Filters
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _showTimeSelectionModal(context);
                  },
                  child: Row(
                    children: [
                      Text("$selected_timeDuration"),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  child: VerticalDivider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _select_firstDate(context),
                  child: Text(
                    '${firstDate.day}/${firstDate.month}/${firstDate.year}',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  'to',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () => _select_lastDate(context),
                  child: Text(
                    '${lastDate.day}/${lastDate.month}/${lastDate.year}',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                SizedBox(width: 20),
                Icon(
                  Remix.calendar_2_line,
                  color: Colors.blueAccent,
                  size: 15,
                ),
              ],
            ),
          ),


          // Checkbox and Sort By
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.blueAccent,
                        value: is_item_having_sale,
                        onChanged: (val) {
                          setState(() {
                            is_item_having_sale = val!;
                          });
                        },
                      ),
                      Text(
                        "Items having sale",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Sort by : ", style: TextStyle(color: Colors.grey)),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedSortBy,
                        items: [
                          DropdownMenuItem(value: "Name", child: Text("Name")),
                          DropdownMenuItem(value: "Amount", child: Text("Amount")),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedSortBy = value!;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Table Header
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Item Name", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Profit/Loss Amount", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Maggie", style: TextStyle(fontSize: 13)),
                      Text("₹50.00", style: TextStyle(fontSize: 13,color: Color(0xFF38C782))),
                    ],
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("₹ 50.0", style: TextStyle(fontWeight: FontWeight.bold,color:Color(0xFF38C782))),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
