

import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Transfer_Cheque extends StatefulWidget {
  const Transfer_Cheque({super.key});

  @override
  State<Transfer_Cheque> createState() => _TransferChequeScreenState();
}

class _TransferChequeScreenState extends State<Transfer_Cheque> {
  TextEditingController dateController = TextEditingController(text: "22/03/2025");

  TextEditingController deposit_to_controller = TextEditingController();


  TextEditingController description_controller = TextEditingController();
  FocusNode description_focusnode = FocusNode();
  bool is_description = false;


  String? selectedBank;
  List<String> bankList = ["Bank A", "Bank B", "Bank C"];

  @override
  void initState() {
    super.initState();
    deposit_to_controller.text = "Date";

    description_focusnode.addListener(() {
      setState(() {
        is_description = description_focusnode.hasFocus;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        bottom: Prefered_underline_appbar(),
        title: Text("Transfer Cheque"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Withdraw From Container
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Withdraw From", style: TextStyle(color: Colors.grey, fontSize: 14)),
                          SizedBox(height: 4),
                          Text("Mohit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Amount", style: TextStyle(color: Colors.grey, fontSize: 14)),
                                  SizedBox(height: 4),
                                  Text("₹ 150.00", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Reference No.", style: TextStyle(color: Colors.grey, fontSize: 14)),
                                  SizedBox(height: 4),
                                  Text("N/A", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                
                    // Transfer Date Picker
                    TextField(
                      controller: dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Enter Transfer Date",
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(Remix.calendar_2_line, color: Colors.blueAccent),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            dateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                          });
                        }
                      },
                    ),
                    SizedBox(height: 16),
                
                    // Deposit To Dropdown
                    TextField(
                      controller: deposit_to_controller,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Deposit to",
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(Remix.arrow_down_s_line, color: Colors.blueAccent),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      onTap: (){
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            backgroundColor: Colors.white,
                            context: context,
                            builder:(context){
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                child: Column(
                                  children: [
                
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Sort by",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                          IconButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Remix.close_line)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(color: Colors.grey.shade200,thickness: 1,),
                
                
                                    ListTile(
                                      onTap: (){
                                        setState(() {
                                          deposit_to_controller.text = "Date";
                                        });
                                        Navigator.pop(context);
                                      },
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      leading: Icon(Remix.calendar_2_line,color: Colors.blueAccent,),
                                      trailing:deposit_to_controller.text=="Date"?Container(height: 10,width: 10,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(90)),):null,
                                      title: Text("Date"),
                                    ),
                                    Divider(color: Colors.grey.shade200,thickness: 1,),
                
                                    ListTile(
                                      onTap: (){
                                        setState(() {
                                          deposit_to_controller.text = "Amount";
                                        });
                                        Navigator.pop(context);
                                      },
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      leading: Icon(Icons.currency_rupee,color: Colors.blueAccent,),
                                      trailing:deposit_to_controller.text=="Amount"?Container(height: 10,width: 10,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(90)),):null,
                                      title: Text("Amount"),
                                    ),
                
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                    SizedBox(height: 16),
                
                    // Description Field
                    TextField(
                      maxLines: 3,
                      controller: description_controller,
                      focusNode: description_focusnode,
                      decoration: InputDecoration(
                        labelText: "Description",
                        floatingLabelStyle: TextStyle(color: is_description?Colors.blueAccent:Colors.grey),
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                    SizedBox(height: 60),
                
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -1,
              right: 0,
              left: 0,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("Save", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
