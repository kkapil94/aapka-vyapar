import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:demo/Home/Transaction%20Details/Add%20Txn/Other%20Transaction/Expenses.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<Expense> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = List.generate(5, (index) => {"title": "Transport", "amount": "₹ 50"});
    List<Map<String, dynamic>> items = List.generate(2, (index) => {"title": "Petrol", "amount": "₹ 50"});

    return Scaffold(
      appBar: AppBar(
        title: Text("Expense", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                // TabBar
                Container(
                  color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 3.0, color: Colors.blue),
                      insets: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.30),
                    ),
                    unselectedLabelColor: Colors.black54,
                    tabs: [
                      Tab(text: "Categories"),
                      Tab(text: "Items"),
                    ],
                  ),
                ),

                //total amounr
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Total: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("₹ 760.00", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                    ],
                  ),
                ),

                // Tab View
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Categories List
                      ListView.builder(
                        padding: EdgeInsets.only(bottom: 80),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(categories[index]["title"], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            trailing: Text(categories[index]["amount"], style: TextStyle(fontSize: 15)),
                            tileColor: Colors.white,
                            shape: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                          );
                        },
                      ),

                      // Items List
                      ListView.builder(
                        padding: EdgeInsets.only(bottom: 80),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(items[index]["title"], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            trailing: Text(items[index]["amount"], style: TextStyle(fontSize: 15)),
                            tileColor: Colors.white,
                            shape: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Add Expenses Button
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Expenses()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE03537),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_circle, color: Colors.white),
                      SizedBox(width: 10),
                      Text("Add New Expenses", style: TextStyle(color: Colors.white)),
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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
