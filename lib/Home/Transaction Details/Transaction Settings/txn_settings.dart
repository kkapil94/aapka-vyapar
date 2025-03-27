import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Transaction_Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TransactionSettingsState();
}

class _TransactionSettingsState extends State<Transaction_Settings> {
  bool invoiceBillNumber = true;
  bool cashSaleByDefault = false;
  bool billingName = false;
  bool poDetails = false;
  bool addTimeOnTransactions = false;

  bool inclusiveTax = true;
  bool displayPurchasePrice = true;
  bool freeItemQuantity = false;
  bool barcodeScanning = false;

  bool transactionWiseTax = false;
  bool transactionWiseDiscount = false;
  bool roundOffAmount = false;

  bool passcodeEdit = false;
  bool discountDuringPayment = false;
  bool linkPayments = false;
  bool enableInvoicePreview = true;

  bool Reverse_Charge = false;
  bool State_of_Supply = true;
  bool E_way_bill_no = false;


  String shareTransactionAs = "Ask me Everytime"; // Dropdown selection

  final List<String> options = ['My Company', 'Company A', 'Company B', 'Company C'];
  String selectedValue = 'My Company';

  bool is_search = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: is_search?
            TextField(
              decoration: InputDecoration(
                hintText: "search",
                border: InputBorder.none,
              ),
            ):
        Text("Transaction", style: TextStyle(color: Colors.black,fontSize: 20),),
        surfaceTintColor: Colors.blue.shade50,
        backgroundColor: Colors.blue.shade50,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          if(is_search==false)
          IconButton(
              onPressed: (){
                setState(() {
                  is_search=true;
                });
              },
              icon: Icon(Icons.search)
          ),

          if(is_search==true)
            IconButton(
              onPressed: (){
                setState(() {
                  is_search=false;
                });
              },
              icon: Icon(Icons.close)
            )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            buildSectionHeader("Transaction Header"),
            buildSwitchTile("Invoice/Bill Number", invoiceBillNumber, (val) {
              setState(() => invoiceBillNumber = val);
            }),
            buildSwitchTile("Cash Sale by default", cashSaleByDefault, (val) {
              setState(() => cashSaleByDefault = val);
            }),
            buildSwitchTile("Billing name of Parties", billingName, (val) {
              setState(() => billingName = val);
            }),
            buildSwitchTile("PO Details (of customer)", poDetails, (val) {
              setState(() => poDetails = val);
            }),
            buildSwitchTile("Add Time On Transactions", addTimeOnTransactions, (val) {
              setState(() => addTimeOnTransactions = val);
            }),

            buildSectionHeader("Items Table"),
            buildSwitchTile("Allow Inclusive/Exclusive tax on Rate (Price/unit)", inclusiveTax, (val) {
              setState(() => inclusiveTax = val);
            }),
            buildSwitchTile("Display Purchase Price", displayPurchasePrice, (val) {
              setState(() => displayPurchasePrice = val);
            }),
            buildSwitchTile("Free Item quantity", freeItemQuantity, (val) {
              setState(() => freeItemQuantity = val);
            }),
            buildSwitchTile("Barcode scanning for items", barcodeScanning, (val) {
              setState(() => barcodeScanning = val);
            }),

            buildSectionHeader("Taxes, Discount & Total"),
            buildSwitchTile("Transaction wise Tax", transactionWiseTax, (val) {
              setState(() => transactionWiseTax = val);
            }),
            buildSwitchTile("Transaction wise Discount", transactionWiseDiscount, (val) {
              setState(() => transactionWiseDiscount = val);
            }),
            buildSwitchTile("Round Off Transaction amount", roundOffAmount, (val) {
              setState(() => roundOffAmount = val);
            }),

            buildSectionHeader("More Transaction Features"),
            buildDropdownTile("Share Transaction as", shareTransactionAs, [
              "Ask me Everytime",
              "PDF",
              "Excel",
              "Image"
            ], (val) {
              setState(() => shareTransactionAs = val!);
            }),
            buildSwitchTile("Passcode for edit/delete", passcodeEdit, (val) {
              setState(() => passcodeEdit = val);
            }),
            buildSwitchTile("Discount during Payment", discountDuringPayment, (val) {
              setState(() => discountDuringPayment = val);
            }),
            buildSwitchTile("Link Payments to Invoices", linkPayments, (val) {
              setState(() => linkPayments = val);
            }),
            buildListTile("Due Dates and Payment terms",(){}),
            buildSwitchTile("Enable Invoice Preview", enableInvoicePreview, (val) {
              setState(() => enableInvoicePreview = val);
            }),
            buildListTile("Additional Fields",(){}),
            buildListTile("Transportation Details",(){}),
            buildListTile("Additional Charges",(){}),

            buildSectionHeader("GST"),
            buildSwitchTile("Reverse Charge", Reverse_Charge, (val) {
              setState(() => Reverse_Charge = val);
            }),
            buildSwitchTile("State of Supply", State_of_Supply, (val) {
              setState(() => State_of_Supply = val);
            }),
            buildSwitchTile("E-Way Bill No.", E_way_bill_no, (val) {
              setState(() => E_way_bill_no = val);
            }),

            buildSectionHeader("Transaction Prefixes"),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Firm",
                        labelStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(Remix.arrow_down_s_fill,size: 15,color: Colors.grey,),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Divider(color: Colors.grey.shade200,thickness: 1),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Sale Invoice",
                              labelStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Remix.arrow_down_s_fill,size: 15,color: Colors.grey,),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Credit Note",
                              labelStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Remix.arrow_down_s_fill,size: 15,color: Colors.grey,),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Sale Order",
                              labelStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Remix.arrow_down_s_fill,size: 15,color: Colors.grey,),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Purchase Order",
                              labelStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Remix.arrow_down_s_fill,size: 15,color: Colors.grey,),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),


                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Estimate",
                              labelStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Remix.arrow_down_s_fill,size: 15,color: Colors.grey,),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Delivery Challan",
                              labelStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Remix.arrow_down_s_fill,size: 15,color: Colors.grey,),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Payment-in",
                              labelStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Remix.arrow_down_s_fill,size: 15,color: Colors.grey,),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      color: Colors.blue.shade50,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title)),

          if(value==true)
          GestureDetector(
            onTap: () => onChanged(false),
            child: Container(
              width: 50, // Increased width
              height: 30, // Increased height to fit the full circle
              child: Stack(
                alignment: Alignment.centerLeft, // Ensures correct positioning
                children: [
                  Container(
                    height: 15,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Positioned(
                    top: 2, // Adjusted positioning to avoid cutting
                    left: 20, // Adjust this dynamically based on toggle state
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle, // More accurate way to create a circle
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if(value==false)
          GestureDetector(
            onTap: () => onChanged(true),
            child: Container(
              width: 50, // Sufficient width
              height: 30, // Increased height to fully fit the circle
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  // Background Track
                  Container(
                    height: 15,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  // Toggle Circle
                  Positioned(
                    left: 0,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )


          // Switch(
          //   value: value,
          //   onChanged: onChanged,
          //   activeColor: Colors.white,
          //   activeTrackColor: Colors.blue.shade300,
          //   inactiveThumbColor: Colors.white,
          //   inactiveTrackColor: Colors.grey.shade400,
          //   trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
          // ),

        ],
      ),
    );
  }

  Widget buildDropdownTile(String title, String selectedValue, List<String> options, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title)),
          DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged,
            underline: Container(),
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

}
