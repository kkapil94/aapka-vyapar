import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Bank_Statement extends StatefulWidget {
  Bank_Statement({super.key});

  @override
  State<Bank_Statement> createState() => _Bank_Statement();
}

class _Bank_Statement extends State<Bank_Statement> {
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

  String _selectedSortBy = "HDFC";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0078AA),
        title: Text(
          "Bank Statement",
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
                    Text("Bank name : ", style: TextStyle(color: Colors.grey)),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedSortBy,
                        items: [
                          DropdownMenuItem(value: "SBI", child: Text("SBI")),
                          DropdownMenuItem(value: "HDFC", child: Text("HDFC")),
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
          ),

          // Table Header

          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Date", style: TextStyle(fontSize: 11))),
                Expanded(child: Text("Description", style: TextStyle(fontSize: 11))),
                Expanded(child: Text("Withdrawal", style: TextStyle(fontSize: 11))),
                Text("Deposit", style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text("21/03/2025", style: TextStyle(fontSize: 11))),
                      Expanded(child: Text("Opening Balance", style: TextStyle(fontSize: 11))),
                      Expanded(child: Text("", style: TextStyle(fontSize: 11))),
                      Text("₹ 100", style: TextStyle(fontSize: 11,color: Color(0xFF38C782))),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(color: Colors.grey.shade400,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text("Total :", style: TextStyle(fontSize: 18)),
                    Text(" ₹ 100", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
