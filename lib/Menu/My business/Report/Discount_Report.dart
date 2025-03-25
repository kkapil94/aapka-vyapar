import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Discount_Report extends StatefulWidget {
  Discount_Report({super.key});

  @override
  State<Discount_Report> createState() => _Discount_Report();
}

class _Discount_Report extends State<Discount_Report> {
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0078AA),
        title: Text(
          "Discount Report",
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


          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Party name", style: TextStyle(fontSize: 13))),
                Text("Sale Discount Purchase /", style: TextStyle(fontSize: 13)),
                Text("Expenses Disc.", style: TextStyle(fontSize: 13)),
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
                      Expanded(child: Text("Mohit", style: TextStyle(fontSize: 13))),
                      Expanded(child: Text("₹ 90.00", style: TextStyle(fontSize: 13))),
                      Text("₹ 90.00", style: TextStyle(fontSize: 13)),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(color: Colors.grey.shade400,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            color: Colors.white,
            child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text("Total Discount", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                    Expanded(child: Text("₹ 99.00", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                    Text("₹ 199.00", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                  ],
                ),
          ),
        ],
      ),
    );
  }
}
