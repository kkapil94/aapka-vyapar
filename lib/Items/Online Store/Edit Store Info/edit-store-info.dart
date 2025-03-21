import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/material.dart';

class Edit_store_info extends StatefulWidget {
  const Edit_store_info({Key? key}) : super(key: key);

  @override
  State<Edit_store_info> createState() => _Edit_store_info();
}

class _Edit_store_info extends State<Edit_store_info> {
  TextEditingController businessName_Controller = TextEditingController();
  FocusNode businessName_focusnode = FocusNode();
  bool is_businessName_focused = false;


  TextEditingController business_description_controller = TextEditingController();
  FocusNode business_description_focusnode = FocusNode();
  bool is_business_description_focused = false;

  TextEditingController business_Address_Controller = TextEditingController();
  FocusNode business_Address_focusnode = FocusNode();
  bool is_business_Address_focused = false;


  TextEditingController gstin_Controller = TextEditingController();
  FocusNode gstin_focusnode = FocusNode();
  bool is_gstin_focused = false;


  TextEditingController contactNumber_Controller = TextEditingController();
  FocusNode contactNumber_focusnode = FocusNode();
  bool is_contactNumber_focused = false;

  TextEditingController email_Controller = TextEditingController();
  FocusNode email_focusnode = FocusNode();
  bool is_email_focused = false;

  @override
  void initState() {
    super.initState();
    businessName_focusnode.addListener((){
      setState(() {
        is_businessName_focused = businessName_focusnode.hasFocus;
      });
    });
    business_description_focusnode.addListener((){
      setState(() {
        is_business_description_focused = business_description_focusnode.hasFocus;
      });
    });

    business_Address_focusnode.addListener((){
      setState(() {
        is_business_Address_focused = business_Address_focusnode.hasFocus;
      });
    });

    gstin_focusnode.addListener((){
      setState(() {
        is_gstin_focused = gstin_focusnode.hasFocus;
      });
    });

    contactNumber_focusnode.addListener((){
      setState(() {
        is_contactNumber_focused = contactNumber_focusnode.hasFocus;
      });
    });

    email_focusnode.addListener((){
      setState(() {
        is_email_focused = email_focusnode.hasFocus;
      });
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text(
          'Update Store Info',
          style: TextStyle(color: Colors.black),
        ),
        bottom: Prefered_underline_appbar(),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Stack(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: Image.asset("Assets/Images/home.png"),
                        ),
                        Positioned(
                          bottom: -MediaQuery.of(context).size.height * 0.0050,
                          right: MediaQuery.of(context).size.width * 0.08,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.edit, color: Colors.blue, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  'Edit',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: 10, color: Colors.blue.shade50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: const Text(
                      'About Business',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      controller: businessName_Controller,
                      focusNode: businessName_focusnode,
                      decoration: InputDecoration(
                          labelText: "Business Name",
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: is_businessName_focused?Colors.blueAccent:Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.blueAccent,width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      controller: business_description_controller,
                      focusNode: business_description_focusnode,
                      maxLines: 3,
                      decoration: InputDecoration(
                          labelText: "Business Description",
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: is_business_description_focused?Colors.blueAccent:Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.blueAccent,width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '160 characters Remaining',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      focusNode: business_Address_focusnode,
                      controller: business_Address_Controller,
                      decoration: InputDecoration(
                          labelText: "Business Address",
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: is_business_Address_focused?Colors.blueAccent:Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.blueAccent,width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      focusNode: gstin_focusnode,
                      controller: gstin_Controller,
                      decoration: InputDecoration(
                          labelText: "GSTIN number (optional)",
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: is_gstin_focused?Colors.blueAccent:Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.blueAccent,width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      focusNode: contactNumber_focusnode,
                      controller: contactNumber_Controller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "Contact Number",
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: is_contactNumber_focused?Colors.blueAccent:Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.blueAccent,width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      controller: email_Controller,
                      focusNode: email_focusnode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email ID",
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: is_email_focused?Colors.blueAccent:Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.blueAccent,width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                          )
                      ),
                    ),
                  ),
                  Container(height: 50,),
                ],
              ),
            ),
            Positioned(
              bottom: -1,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 50,
                color: Color(0xFFE03537),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
