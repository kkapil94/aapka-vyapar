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
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Adjust Stock',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
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
                  activeColor: Colors.blue,
                ),
                const Text('Add Stock', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 20),
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
                ),
                const Text('Reduce Stock', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 20),

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
            const SizedBox(height: 15),

            // Quantity input
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Quantity',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Price input
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Price',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Adjustment details input
            TextField(
              controller: detailsController,
              decoration: InputDecoration(
                hintText: 'Adjustment Details',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
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
