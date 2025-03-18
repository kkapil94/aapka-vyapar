
import 'package:aapka_vyapar/Home/Add_Items_to_Sale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

class Sale_Invoice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SaleInvoice();
}

class SaleInvoice extends State<Sale_Invoice> {

  var time = DateTime.now();
  var invoice_no = 0;
  String? enteredText;
  String? selectedPaymentType = "Cash";
  String? Country = "Gujrat";
  bool isChecked = false;


  String? selectedState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Sale'),
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showInvoiceSheet(context);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Invoice No."),
                                Row(
                                  children: [
                                    Text("$invoice_no"),
                                    Icon(
                                      FlutterRemix.arrow_down_line,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("Date", style: TextStyle(fontSize: 16)),
                              TextButton(
                                onPressed: () async {
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
                                child: Text(
                                  "${time.day}/${time.month}/${time.year}",
                                  style: TextStyle(fontSize: 16, color: Colors.blue),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
                          labelText: "Phone Number",
                          hintText: "Phone number",
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
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>Add_Items_to_Sale(title: "Add Items to Sale invoice")));
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
                      SizedBox(height: 16),
                      Container(
                        color: Colors.white12,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Total Amount",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15, // Fixed width for rupee symbol
                                    child: Icon(Icons.currency_rupee, size: 15),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          enteredText = value;
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.end,
                                      decoration: InputDecoration(
                                        hintText: "_________", // Example placeholder value
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (enteredText != null && enteredText!.isNotEmpty)
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Checkbox(
                                          value: isChecked,
                                          activeColor: Colors.blueAccent,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Received",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 15.0),
                                          child: SizedBox(
                                            width: 15, // Fixed width for rupee symbol
                                            child: Icon(Icons.currency_rupee, size: 15, color: Colors.black),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: TextField(
                                            onChanged: (value) {
                                              setState(() {
                                                enteredText = value;
                                              });
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.end,
                                            decoration: InputDecoration(
                                              hintText: "_________", // Example placeholder value
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Balance Due",
                                            style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15, // Fixed width for rupee symbol
                                          child: Icon(Icons.currency_rupee,
                                              size: 15, color: Colors.greenAccent),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "0",
                                              style: TextStyle(color: Colors.greenAccent, fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Payment Type", style: TextStyle(fontSize: 15, color: Colors.black)),
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
                                                          builder: (context, setStateModal) { // Use setStateModal for local state changes
                                                            return Padding(
                                                              padding: const EdgeInsets.all(16.0),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  Text("Payment Type",style: TextStyle(fontSize: 22),),
                                                                  ListTile(
                                                                    leading: Icon(Icons.money, color: Colors.green),
                                                                    title: Text("Cash"),
                                                                    onTap: () {
                                                                      setState(() {
                                                                        selectedPaymentType = "Cash";
                                                                      });
                                                                      Navigator.pop(context);
                                                                    },
                                                                    tileColor: selectedPaymentType == "Cash"
                                                                        ? Colors.grey[200]
                                                                        : null,
                                                                  ),
                                                                  ListTile(
                                                                    leading: Icon(Icons.receipt_long, color: Colors.yellow),
                                                                    title: Text("Cheque"),
                                                                    onTap: () {
                                                                      setState(() {
                                                                        selectedPaymentType = "Cheque";
                                                                      });
                                                                      Navigator.pop(context);
                                                                    },
                                                                    tileColor: selectedPaymentType == "Cheque"
                                                                        ? Colors.grey[200]
                                                                        : null,
                                                                  ),
                                                                  Divider(),
                                                                  ListTile(
                                                                    leading: Icon(Icons.add, color: Colors.blue),
                                                                    title: Text("Add Bank A/c"),
                                                                    onTap: () {
                                                                      // Handle "Add Bank A/c" logic
                                                                      Navigator.pop(context);
                                                                    },
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
                                                      Icon(
                                                        selectedPaymentType == "Cash"
                                                            ? Icons.money
                                                            : selectedPaymentType == "Cheque"
                                                            ? Icons.receipt_long
                                                            : Icons.help_outline, // Default icon when null
                                                        color: selectedPaymentType == "Cash"
                                                            ? Colors.green
                                                            : selectedPaymentType == "Cheque"
                                                            ? Colors.yellow
                                                            : Colors.grey, // Default color when null
                                                      ),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        selectedPaymentType ?? "Select", // Fallback if null
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
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text("+Add Payment Type",style: TextStyle(color: Colors.blueAccent,fontSize: 16),),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      children: [
                                        Row(
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
                                      ],
                                    ),
                                  ),
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
                                  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.grey),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text("Attach document",style: TextStyle(fontSize: 11),),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),


                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text("Save & New", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text("Save"),
                    ),
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
