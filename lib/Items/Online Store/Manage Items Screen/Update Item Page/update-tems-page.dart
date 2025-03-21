import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/material.dart';

// Update Item page
class UpdateItemPage extends StatefulWidget {
  @override
  State<UpdateItemPage> createState() => _UpdateItemPageState();
}

class _UpdateItemPageState extends State<UpdateItemPage> {
  TextEditingController _nameController = TextEditingController();
  FocusNode _nameFocusNode = FocusNode();
  bool is_name_focused = false;

  TextEditingController _priceController = TextEditingController();
  FocusNode _priceFocusNode = FocusNode();
  bool is_price_focused = false;

  TextEditingController _descriptionController = TextEditingController();
  FocusNode _descriptionFocusNode = FocusNode();
  bool is_description_focused = false;

  String _selectedCategory = 'Grocery';
  List<String> _categories = ['Grocery', 'Clothing', 'Electronics', 'Home'];

  @override
  void initState() {
    super.initState();

    _nameFocusNode.addListener((){
      setState(() {
        is_name_focused = _nameFocusNode.hasFocus;
      });
    });

    _priceFocusNode.addListener((){
      setState(() {
        is_price_focused = _priceFocusNode.hasFocus;
      });
    });

    _descriptionFocusNode.addListener((){
      setState(() {
        is_description_focused = _descriptionFocusNode.hasFocus;
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
          'Update Item',
          style: TextStyle(color: Colors.black),
        ),
        bottom: Prefered_underline_appbar(),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility, color: Colors.black54),
            onPressed: () {},
          ),
        ],
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
                    // Image upload section
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE3F2FD),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add, color: Colors.blue, size: 25),
                                  SizedBox(height: 10),
                                  Text(
                                    'Add Image',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'You can add upto 5 images',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(color: Colors.blue.shade50,height: 10,),
              
                    // Item Info section
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                      width: double.infinity,
                      child: Text(
                        'Item Info',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
              
                    // Product Name field
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      child: TextField(
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Product Name',
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: is_name_focused?Colors.blueAccent:Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent,width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(8),
                          )
                        ),
                      ),
                    ),
              
                    // Online store Price field
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: TextField(
                        controller: _priceController,
                        focusNode: _priceFocusNode,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Online store Price',
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: is_price_focused ?Colors.blueAccent:Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent,width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(8),
                          )
                        ),
                      ),
                    ),
              
                    // Category dropdown
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Category',
                            labelStyle: TextStyle(color: Colors.grey),
                            floatingLabelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(8),
                            )
                        ),
                      ),
                    ),


                    // Product Description field
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: TextField(
                        controller: _descriptionController,
                        focusNode: _descriptionFocusNode,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Product Description',
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: is_description_focused ?Colors.blueAccent:Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent,width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(8),
                          )
                        ),
                      ),
                    ),
              
                    SizedBox(height: 55),
                  ],
                ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -1,
              child: Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Save logic here
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE03537),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
