import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdjustStockScreen extends StatefulWidget {
  final String itemName;

  const AdjustStockScreen({Key? key, required this.itemName}) : super(key: key);

  @override
  _AdjustStockScreenState createState() => _AdjustStockScreenState();
}

class _AdjustStockScreenState extends State<AdjustStockScreen> {
  bool isAddStock = true;
  DateTime selectedDate = DateTime.now();
  TextEditingController quantityController = TextEditingController();
  FocusNode quantity_focusnode = FocusNode();
  bool is_quantity_focused = false;


  final TextEditingController priceController = TextEditingController();
  FocusNode price_focusnode = FocusNode();
  bool is_price_focused = false;


  final TextEditingController detailsController = TextEditingController();
  FocusNode details_focusnode = FocusNode();
  bool is_details_focused = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    quantity_focusnode.addListener((){
      setState(() {
        is_quantity_focused = quantity_focusnode.hasFocus;
      });
    });
    price_focusnode.addListener((){
      setState(() {
        is_price_focused = price_focusnode.hasFocus;
      });
    });
    details_focusnode.addListener((){
      setState(() {
        is_details_focused = details_focusnode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Adjust Stock',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Stock adjustment type selection
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: isAddStock,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        isAddStock = value;
                      });
                    }
                  },
                  activeColor: Colors.blueAccent,
                ),
                Text('Add Stock', style: TextStyle(fontSize: 16)),
                SizedBox(width: 20),
                Radio(
                  value: false,
                  groupValue: isAddStock,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        isAddStock = value;
                      });
                    }
                  },
                  activeColor: Colors.blueAccent,
                ),
                Text('Reduce Stock', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),

            // Date selection
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy').format(selectedDate),
                      style: const TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.calendar_today, color: Colors.blue),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),

            // Quantity input
            TextField(
              controller: quantityController,
              focusNode: quantity_focusnode,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Quantity",
                labelStyle: TextStyle(color: Colors.grey),
                floatingLabelStyle: TextStyle(color: is_quantity_focused?Colors.blueAccent:Colors.grey),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                ),
              ),
            ),
            SizedBox(height: 15),

            // Price input
            TextField(
              controller: priceController,
              focusNode: price_focusnode,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Price",
                labelStyle: TextStyle(color: Colors.grey),
                floatingLabelStyle: TextStyle(color: is_price_focused?Colors.blueAccent:Colors.grey),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                ),
              ),
            ),
            SizedBox(height: 15),

            // Adjustment details input
            TextField(
              controller: detailsController,
              focusNode: details_focusnode,
              decoration: InputDecoration(
                labelText: "Adjustment Details",
                labelStyle: TextStyle(color: Colors.grey),
                floatingLabelStyle: TextStyle(color: is_details_focused?Colors.blueAccent:Colors.grey),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                ),
              ),
            ),

            const Spacer(),

            // Add/Reduce Stock button
            ElevatedButton(
              onPressed: () {
                // Handle the stock adjustment here
                final quantity = int.tryParse(quantityController.text) ?? 0;
                final price = double.tryParse(priceController.text) ?? 0.0;
                final details = detailsController.text;

                // TODO: Implement the stock adjustment logic

                Navigator.pop(context, {
                  'isAdd': isAddStock,
                  'date': selectedDate,
                  'quantity': quantity,
                  'price': price,
                  'details': details,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                isAddStock ? 'Add Stock' : 'Reduce Stock',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    quantityController.dispose();
    priceController.dispose();
    detailsController.dispose();
    super.dispose();
  }
}

// Example of how to navigate to this screen:
//
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => AdjustStockScreen(itemName: 'Patato'),
//   ),
// );
