import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:remixicon/remixicon.dart';

import '../../../BottomNavbar_save_buttons.dart';
import 'Add_Items_to_Sale.dart';


class Delivery_Challan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => DeliveryChallan();
}


class DeliveryChallan extends State<Delivery_Challan> {
  var time = DateTime.now();

  var invoice_no = 0;
  String? enteredText;
  String? selectedPaymentType = "Cash";
  String? Country = "Gujrat";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Delivery Challan'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              height: 1,
              color: Colors.grey.withOpacity(0.5),
            )),
        actions: [
          IconButton(
            icon: Icon(FlutterRemix.settings_2_line),
            onPressed: () {
              // Add settings functionality here
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbarSaveButton(leftButtonText: 'save & new', rightButtonText: 'save', leftButtonColor: Colors.white,rightButtonColor: Colors.blueAccent,onLeftButtonPressed: (){},onRightButtonPressed: (){},),
      body: Container(
        color:  Color(0xFFE8E8E8),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color:Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    showInvoiceSheet(context);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Recipt No.",style: TextStyle(color: Colors.grey),),
                                      Row(
                                        children: [
                                          Text("$invoice_no"),
                                          SizedBox(width: 5,),
                                          Icon(
                                            Remix.arrow_down_s_line,
                                            size: 20,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  color: Colors.grey.shade300,
                                  thickness: 2,
                                  width: 20,
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    showInvoiceSheet(context);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          DateTime? selectedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                          );
                                          if (selectedDate != null) {
                                            setState(() {
                                              time = selectedDate;
                                            });
                                          }
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Date",style: TextStyle(color: Colors.grey),),
                                            Row(
                                              children: [
                                                Text(
                                                  "${time.day}/${time.month}/${time.year}",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Icon(
                                                  Remix.arrow_down_s_line,
                                                  size: 20,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Customer",
                                hintText: "Customer name",
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
                            SizedBox(height: 16),
                            TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "Date",
                                prefixIcon: Icon(FlutterRemix.calendar_2_line),
                                hintText: "${time.day/time.month/time.year}",
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
                            SizedBox(height: 24),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Add_Items_to_Sale(
                                        title: 'Add Items Delivery Challan',
                                      );
                                    },
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.blueAccent),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add, color: Colors.blueAccent),
                                  SizedBox(width: 8),
                                  Text("Add Items", style: TextStyle(color: Colors.blueAccent)),
                                  SizedBox(width: 8),
                                  Text("(Optional)", style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),



                      Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.white12,
                        child: Column(
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Total Price",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15, // Fixed width for rupee symbol
                                    child: Icon(Icons.currency_rupee, size: 15),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: [
                                        // Dotted Border (Only Bottom)
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: DottedBorder(
                                            color: Colors.grey,
                                            strokeWidth: 1.5, // Border thickness
                                            dashPattern: [5, 3], // Dotted pattern
                                            borderType: BorderType.Rect, // Rectangle border
                                            padding: EdgeInsets.zero, // No padding inside
                                            customPath: (size) => Path()
                                              ..moveTo(0, size.height) // Start from bottom-left
                                              ..lineTo(size.width, size.height), // Draw to bottom-right
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: 0, // Invisible container to align with textfield
                                            ),
                                          ),
                                        ),

                                        // TextField
                                        TextField(
                                          onChanged: (value) {
                                            setState(() {
                                              enteredText = value;
                                            });
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                            border: InputBorder.none, // Removes default border
                                            contentPadding: EdgeInsets.only(bottom: 5), // Align text properly
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      if(enteredText!=null && enteredText!.isNotEmpty)
                        Container(
                        padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                        color: Colors.white,
                        child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("State", style: TextStyle(fontSize: 15, color: Colors.black)),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            backgroundColor: Colors.white,
                                            context: context,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                            ),
                                            builder: (context) {
                                              return StatefulBuilder(
                                                builder: (context, setStateModal) {
                                                  return Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "Select State",
                                                          style: TextStyle(fontSize: 22),
                                                        ),
                                                        Divider(),
                                                        Expanded(
                                                          child: ListView(
                                                            children: [
                                                              for (var state in [
                                                                "Andhra Pradesh",
                                                                "Arunachal Pradesh",
                                                                "Assam",
                                                                "Bihar",
                                                                "Chhattisgarh",
                                                                "Goa",
                                                                "Gujarat",
                                                                "Haryana",
                                                                "Himachal Pradesh",
                                                                "Jharkhand",
                                                                "Karnataka",
                                                                "Kerala",
                                                                "Madhya Pradesh",
                                                                "Maharashtra",
                                                                "Manipur",
                                                                "Meghalaya",
                                                                "Mizoram",
                                                                "Nagaland",
                                                                "Odisha",
                                                                "Punjab",
                                                                "Rajasthan",
                                                                "Sikkim",
                                                                "Tamil Nadu",
                                                                "Telangana",
                                                                "Tripura",
                                                                "Uttar Pradesh",
                                                                "Uttarakhand",
                                                                "West Bengal",
                                                                "Andaman and Nicobar Islands",
                                                                "Chandigarh",
                                                                "Dadra and Nagar Haveli and Daman and Diu",
                                                                "Delhi",
                                                                "Jammu and Kashmir",
                                                                "Ladakh",
                                                                "Lakshadweep",
                                                                "Puducherry"
                                                              ])
                                                                ListTile(
                                                                  title: Text(state),
                                                                  onTap: () {
                                                                    setState(() {
                                                                      Country = state;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  tileColor: Country == state
                                                                      ? Colors.grey[200]
                                                                      : null,
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              Country ?? "Select", // Fallback if null
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Icon(Icons.arrow_drop_down, color: Colors.grey),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ),


                      if(enteredText!=null && enteredText!.isNotEmpty)
                      Column(
                        children: [
                          Container(height: 20,color: Colors.white,),
                          SizedBox(height: 10,),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 16,right: 16.0,top: 8,bottom: 8),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: SizedBox(
                                    height:75,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              labelText: "Description",
                                              hintText: 'Add Note',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                borderSide: BorderSide(color: Colors.blue, width: 1.5),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                              ),
                                              contentPadding: EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0,
                                              ),
                                            ),
                                            maxLines: 3, // Allows multi-line input
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        GestureDetector(
                                          onTap:(){
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero,
                                                  ),
                                                  content: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      ListTile(
                                                        title: Text("Camera"),
                                                        onTap: () {
                                                          Navigator.pop(context); // Close the dialog
                                                        },
                                                      ),
                                                      Divider(),
                                                      ListTile(
                                                        title: Text("Gallery"),
                                                        onTap: () {
                                                          Navigator.pop(context); // Close the dialog
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }, // Show the dialog on tap
                                          child: Container(
                                            width: 75,
                                            height: 75,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.blue, width: 1.5),
                                              borderRadius: BorderRadius.circular(8.0),
                                              color: Colors.grey[100],
                                            ),
                                            child: Icon(FlutterRemix.camera_line),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),


                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
}

List<String> PrefixName = ["None"];
List<int> PrefixNumber = [0];

int _selectedButton = 0;
String? newPrefix;
void showInvoiceSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 2.0,
              right: 2.0,
              top: 10.0,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Change Receipt No.",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.cancel,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Invoice Prefix",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: PrefixName.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedButton = index;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: index == _selectedButton
                                              ? Colors.redAccent
                                              : Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        color: index == _selectedButton
                                            ? Colors.red[50]
                                            : Colors.transparent,
                                      ),
                                      child: Text(
                                        '${PrefixName[index]}',
                                        style: TextStyle(
                                          color: index == _selectedButton
                                              ? Colors.redAccent
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'Add Prefix',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  backgroundColor: Colors.white,
                                  content: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      width: 600,
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: "Prefix Name",
                                          hintText: "e.g. INV",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Colors.blueAccent,
                                                width: 2.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1.0),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          newPrefix = value;
                                        },
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.blueAccent),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (newPrefix != null &&
                                            newPrefix!.isNotEmpty) {
                                          setState(() {
                                            PrefixName.add(newPrefix!);
                                            newPrefix = null;
                                          });
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text(
                                        "Save",
                                        style: TextStyle(color: Colors.blueAccent),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[50],
                            ),
                            child: Text(
                              'Add Prefix',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Invoice No",
                          hintText: "Invoice No",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          onPressed: () {
                            // Save logic
                          },
                          child: Text("SAVE"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}