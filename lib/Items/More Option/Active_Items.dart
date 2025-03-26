import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/material.dart';

class Active_Items extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Active_Items();
}

class _Active_Items extends State<Active_Items> {
  bool isProductSelected = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        bottom: Prefered_underline_appbar(),
        title: Text("Active Items", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle between Products & Services
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isProductSelected = true;
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: isProductSelected,
                          onChanged: (value) {
                            setState(() {
                              isProductSelected = true;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        Text("Products"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isProductSelected = false;
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                          value: false,
                          groupValue: isProductSelected,
                          onChanged: (value) {
                            setState(() {
                              isProductSelected = false;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        Text("Services"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Search Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.blue),
                hintText: "Search by Name or Code",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.grey.shade200,width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.grey.shade200,width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.grey.shade200,width: 1),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
            SizedBox(height: 10),

            // Select All Checkbox
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  activeColor: Colors.blue,
                ),
                SizedBox(width: 10,),
                Text("Select All"),
              ],
            ),
            SizedBox(height: 5),

            // List of Inactive Items
            Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context,index){
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      title: Text("Chips"),
                      trailing: Text("40.0", style: TextStyle(color: Colors.black,fontSize: 16)),
                    );
                  }
              ),
            ),

            // Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text("Cancel"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text("Mark as Active"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

