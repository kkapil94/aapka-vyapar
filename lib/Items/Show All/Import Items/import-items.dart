import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:demo/Items/Show%20All/Import%20Items/Libraby%20Items/library-items.dart';
import 'package:demo/Items/Show%20All/Import%20Items/Ms%20Excel/ms-excel.dart';
import 'package:flutter/material.dart';

class ImportItemsPage extends StatelessWidget {
  const ImportItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Import Items', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
        bottom: Prefered_underline_appbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child:
                      Icon(Icons.bar_chart, color: Colors.blue[400], size: 28),
                ),
                title: const Text(
                  'Item Library',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: const Text(
                  'Add Items from our database of items',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.blue),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ItemLibraryPage()),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(Icons.description,
                      color: Colors.blue[400], size: 28),
                ),
                title: const Text(
                  'Microsoft Excel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: const Text(
                  'Upload your items from an Excel file',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.blue),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExcelUploadScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
