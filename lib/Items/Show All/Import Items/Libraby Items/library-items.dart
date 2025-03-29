import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:demo/Items/Show%20All/Import%20Items/Category%20Detail/category-details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemLibraryPage extends StatefulWidget {
  const ItemLibraryPage({Key? key}) : super(key: key);

  @override
  State<ItemLibraryPage> createState() => _ItemLibraryPageState();
}

class _ItemLibraryPageState extends State<ItemLibraryPage> {
  void _showIndustryFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        final List<String> industries = [
          'Pharma',
          'FMCG, General Stores',
          'Electronics & Accessories',
          'Others'
        ];
        List<bool> selectedIndustries = [false, false, false, false];

        return Container(
          padding: const EdgeInsets.only(top: 16),
          height: MediaQuery.of(context).size.height * 0.46,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      'Filter by Industry',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon:  Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),
              Expanded(
                child: ListView.separated(
                  itemCount: industries.length,
                  separatorBuilder: (context, index) =>Divider(color: Colors.grey.shade200,thickness: 1,),
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      title: Text(
                        industries[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      value: selectedIndustries[index],
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedIndustries[index] = value!;
                        });
                      },
                    );
                  },
                ),
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedIndustries =
                                List.filled(industries.length, false);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: BorderSide(color: Colors.grey),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text('Clear All',style: TextStyle(color: Colors.black),),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Apply filter logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text('Apply',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Item Library', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: Prefered_underline_appbar(),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton.icon(
              onPressed: _showIndustryFilterBottomSheet,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              icon: const Icon(Icons.filter_list),
              label: const Text('Filter by Industry'),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade300,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Text(
              'Select a Category',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Chocolates and Toffees',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right, color: Colors.blue),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryDetailsPage()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
