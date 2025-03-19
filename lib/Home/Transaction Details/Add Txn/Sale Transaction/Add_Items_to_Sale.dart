import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

class Add_Items_to_Sale extends StatefulWidget {
  String title;
  Add_Items_to_Sale({required this.title});
  @override
  State<StatefulWidget> createState() => _AddItemsToSaleState(title: title);
}

class _AddItemsToSaleState extends State<Add_Items_to_Sale> {
  String? selectedUnit = 'Kilogram';
  String? taxOption = 'Without Tax';
  String?title;
  _AddItemsToSaleState({required String title}){
     this.title  = title;
  }


  String selectedGstLabel = "None";
  double selectedGstValue = 0.0;
  final Map<String, double> gstOptions = {
    "Exempted": 0.0,
    "GST@0%": 0.0,
    "IGST@0%": 0.0,
    "GST@0.25%": 0.25,
    "IGST@0.25%": 0.25,
    "GST@3%": 3.0,
    "IGST@3%": 3.0,
    "GST@5%": 5.0,
    "IGST@5%": 5.0,
    "GST@12%": 12.0,
    "IGST@12%": 12.0,
    "GST@18%": 18.0,
    "IGST@18%": 18.0,
    "GST@28%": 28.0,
    "IGST@28%": 28.0,
  };

  void _showGstBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tax %",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: gstOptions.length,
                  itemBuilder: (context, index) {
                    final key = gstOptions.keys.elementAt(index); // Get the label
                    final value = gstOptions[key]!; // Get the percentage value
                    return ListTile(
                      title: Text(key), // Show the label
                      trailing: Text("${value.toStringAsFixed(1)}%"), // Show the value
                      onTap: () {
                        setState(() {
                          selectedGstLabel = key;
                          selectedGstValue = value;
                        });
                        Navigator.pop(context); // Close the bottom sheet
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
        backgroundColor: Colors.white,
        title: Text(title!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: Icon(FlutterRemix.settings_2_line),
            onPressed: () {
              // Add settings functionality here
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Item Name",
                    hintText: "e.g. Chocolate Cake",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Quantity",
                          hintText: "Quantity",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedUnit,
                        items: [
                          DropdownMenuItem(child: Text('Kilogram'), value: 'Kilogram'),
                          DropdownMenuItem(child: Text('Liter'), value: 'Liter'),
                          DropdownMenuItem(child: Text('Gram'), value: 'Gram'),
                          DropdownMenuItem(child: Text('Piece'), value: 'Piece'),
                          DropdownMenuItem(child: Text('Packet'), value: 'Packet'),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedUnit = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Unit",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Rate (Price/Unit)",
                          hintText: "Rate (Price/Unit)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: taxOption,
                        items: [
                          DropdownMenuItem(child: Text('Without Tax'), value: 'Without Tax'),
                          DropdownMenuItem(child: Text('With Tax'), value: 'With Tax'),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            taxOption = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Tax Option",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Totals & Taxes',
                  style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                            child: Text("Subtotal (Rate x Qty)")
                        ),
                        Icon(Icons.currency_rupee,size: 15,),
                        SizedBox(width: 50,),
                        Text("0")
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Discount Label
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Discount",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),

                        // Percentage Input and % Symbol
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 90, // Set exact width for the TextField
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.orangeAccent, width: 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                    border: InputBorder.none, // Remove the default border
                                  ),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.orangeAccent, width: 1),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
                              ),
                              child: Text(
                                "%",
                                style: TextStyle(color: Colors.orangeAccent, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                ),
                              ),
                              child: Text(
                                "₹",
                                style: TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 90, // Set exact width for the TextField
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                    border: InputBorder.none, // Remove the default border
                                  ),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Discount Label
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Tax %",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),

                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => _showGstBottomSheet(context),
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedGstLabel,
                                        style: TextStyle(fontSize: 14, color: Colors.black),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                ),
                              ),
                              child: Text(
                                "₹",
                                style: TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 90, // Set exact width for the TextField
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
                              ),
                              child: TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: "0.00",
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                    border: InputBorder.none, // Remove the default border
                                  ),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),

                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text("Total Amount",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                        ),
                        Icon(Icons.currency_rupee,size: 17,),
                        SizedBox(width: 50,),
                        Text("0",style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 130,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Save & New functionality
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text(
                          "Save & New",
                          style: TextStyle(fontSize: 16,),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Save functionality
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
