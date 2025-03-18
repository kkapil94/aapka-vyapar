import 'package:aapka_vyapar/Items/Manage%20Items%20Screen/Update%20Item%20Page/update-tems-page.dart';
import 'package:flutter/material.dart';

class ManageItemsPage extends StatefulWidget {
  const ManageItemsPage({Key? key}) : super(key: key);

  @override
  State<ManageItemsPage> createState() => _ManageItemsPageState();
}

class _ManageItemsPageState extends State<ManageItemsPage> {
  String selectedCategory = 'All';
  List<String> categories = ['All', 'Grocery'];
  List<Map<String, dynamic>> items = [
    {
      'name': 'Wheat',
      'price': 35,
      'unit': 'KG',
      'inStock': true,
      'category': 'Grocery'
    },
    {
      'name': 'Wall Clock',
      'price': 1200,
      'unit': 'Each',
      'inStock': true,
      'category': 'Home'
    },
    {
      'name': 'Action Figure',
      'price': 750,
      'unit': 'Each',
      'inStock': true,
      'category': 'Toys'
    },
  ];

  void _showMoreOptions(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More Option',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.black54),
                title: Text('Edit Item'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateItemPage(item: items[index]),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.share, color: Colors.black54),
                title: Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                  // Share logic here
                },
              ),
              ListTile(
                leading: Icon(Icons.visibility_off, color: Colors.black54),
                title: Text("Don't Show this in Store"),
                onTap: () {
                  Navigator.pop(context);
                  // Hide from store logic here
                },
              ),
              ListTile(
                leading: Icon(Icons.category, color: Colors.black54),
                title: Text('Update Categories'),
                onTap: () {
                  Navigator.pop(context);
                  // Update categories logic here
                },
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
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Manage Items',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const SizedBox(width: 10),
                OutlinedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Categories'),
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((category) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedCategory == category
                                  ? const Color(0xFFFF9999)
                                  : Colors.white,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(
                                  color: selectedCategory == category
                                      ? const Color(0xFFFF5555)
                                      : Colors.grey,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                            ),
                            child: Text(category),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search items',
                  prefixIcon: const Icon(Icons.search, color: Colors.blue),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.blue),
                    onPressed: () {},
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                if (selectedCategory != 'All' &&
                    item['category'] != selectedCategory) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6F2FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.add,
                                color: Colors.blue, size: 30),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '₹ ${item['price']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Per ${item['unit']}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.more_vert),
                                onPressed: () {
                                  _showMoreOptions(context, index);
                                },
                              ),
                              Row(
                                children: [
                                  const Text('In Stock'),
                                  const SizedBox(width: 10),
                                  Switch(
                                    value: item['inStock'],
                                    onChanged: (value) {
                                      setState(() {
                                        item['inStock'] = value;
                                      });
                                    },
                                    activeColor: Colors.blue,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFFF5555),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpdateItemPage()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Items'),
      ),
    );
  }
}
