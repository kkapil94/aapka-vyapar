import 'package:aapka_vyapar/Items/Import%20Items/Category%20Detail/category-details.dart';
import 'package:flutter/material.dart';

class ItemLibraryPage extends StatefulWidget {
  const ItemLibraryPage({Key? key}) : super(key: key);

  @override
  State<ItemLibraryPage> createState() => _ItemLibraryPageState();
}

class _ItemLibraryPageState extends State<ItemLibraryPage> {
  void _showIndustryFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return const FilterByIndustryBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Item Library',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
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
                  title: const Text(
                    'Chocolates and Toffees',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right, color: Colors.blue),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryDetailsPage()),
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

// Filter by Industry Bottom Sheet
class FilterByIndustryBottomSheet extends StatefulWidget {
  const FilterByIndustryBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterByIndustryBottomSheet> createState() =>
      _FilterByIndustryBottomSheetState();
}

class _FilterByIndustryBottomSheetState
    extends State<FilterByIndustryBottomSheet> {
  final List<String> industries = [
    'Pharma',
    'FMCG, General Stores',
    'Electronics & Accessories',
    'Others'
  ];
  List<bool> selectedIndustries = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter by Industry',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.separated(
              itemCount: industries.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(
                    industries[index],
                    style: const TextStyle(
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
          const Divider(height: 1),
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
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Clear All'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Apply filter logic here
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Apply'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
