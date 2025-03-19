import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaction",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFDAE7F2),
        iconTheme: IconThemeData(color: Colors.black),
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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    String? value = await showModalBottomSheet<String>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: options.map((option) {
                              return ListTile(
                                title: Text(option),
                                onTap: () {
                                  Navigator.pop(context, option);
                                },
                              );
                            }).toList(),
                          ),
                        );
                      },
                    );
                    if (value != null) {
                      setState(() {
                        selectedValue = value;
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      readOnly: true,
                      controller: TextEditingController(text: selectedValue),
                      decoration: InputDecoration(
                        labelText: "Firm",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.black45, width: 2.0),
                        ),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        String? value = await showModalBottomSheet<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: options.map((option) {
                                  return ListTile(
                                    title: Text(option),
                                    onTap: () {
                                      Navigator.pop(context, option);
                                    },
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        );
                        if (value != null) {
                          setState(() {
                            selectedValue = value;
                          });
                        }
                      },
                      child: AbsorbPointer(
                        child: TextField(
                          readOnly: true,
                          controller: TextEditingController(text: selectedValue),
                          decoration: InputDecoration(
                            labelText: "Sale Invoice",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.black45, width: 2.0),
                            ),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        String? value = await showModalBottomSheet<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: options.map((option) {
                                  return ListTile(
                                    title: Text(option),
                                    onTap: () {
                                      Navigator.pop(context, option);
                                    },
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        );
                        if (value != null) {
                          setState(() {
                            selectedValue = value;
                          });
                        }
                      },
                      child: AbsorbPointer(
                        child: TextField(
                          readOnly: true,
                          controller: TextEditingController(text: selectedValue),
                          decoration: InputDecoration(
                            labelText: "Firm",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.black45, width: 2.0),
                            ),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                    ),
                  ),
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
      color: Color(0xFFDAE7F2),
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.blue.shade300,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade400,
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
          ),

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
