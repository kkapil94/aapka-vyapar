import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:demo/Items/Online%20Store/Manage%20Items%20Screen/Update%20Item%20Page/update-tems-page.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

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

  void _showMoreOptionsOfItem(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
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
              Divider(color: Colors.grey.shade200,thickness: 1,),
              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                leading: Icon(Remix.pencil_line, color: Colors.black54),
                title: Text('Edit Item'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateItemPage(),
                    ),
                  );
                },
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),

              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                leading: Icon(Remix.share_forward_line, color: Colors.black54),
                title: Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                  // Share logic here
                },
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),

              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                leading: Icon(Remix.eye_off_line, color: Colors.black54),
                title: Text("Don't Show this in Store"),
                onTap: () {
                  Navigator.pop(context);
                  // Hide from store logic here
                },
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),

              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                leading: Icon(Remix.box_3_line, color: Colors.black54),
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
  
  String filter_by = "All Items";

  void _showFilterOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter By',
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
              Divider(color: Colors.grey.shade200,thickness: 1,),
              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: Text('All Items'),
                trailing: filter_by=="All Items"?Container(height: 10,width: 10,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(90)),):null,
                onTap: () {
                 setState(() {
                   filter_by = "All Items";
                 });
                 Navigator.pop(context);
                },
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),

              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: Text('In Stock'),
                trailing: filter_by=="In Stock"?Container(height: 10,width: 10,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(90)),):null,
                onTap: () {
                  setState(() {
                    filter_by = "In Stock";
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),

              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: Text("Out of Stock"),
                trailing: filter_by=="Out of Stock"?Container(height: 10,width: 10,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(90)),):null,
                onTap: () {
                  setState(() {
                    filter_by = "Out of Stock";
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),

              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: Text('Show Items not in Store'),
                trailing: filter_by=="Show Items not in Store"?Container(height: 10,width: 10,decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(90)),):null,
                onTap: () {
                  setState(() {
                    filter_by = "Show Items not in Store";
                  });
                  Navigator.pop(context);
                },
              ),

            ],
          ),
        );
      },
    );
  }

  void _showFMoreOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More Options',
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
              Divider(color: Colors.grey.shade200,thickness: 1,),
              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: Text('Edit Items List'),
                subtitle: Text("Choose this when you want to add or remove items from your Online Store."),
                trailing: Icon(Remix.arrow_right_s_line),
                onTap: () {
                },
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),

              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: Text('Share online store'),
                subtitle: Text("Choose this when you want to share your online store sciomore."),
                trailing: Icon(Remix.arrow_right_s_line),
                onTap: () {
                 
                },
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),

              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: Text("Share Multiple Items"),
                subtitle: Text("Chosee this when you want to share more than one item with customers"),
                trailing: Icon(Remix.arrow_right_s_line),
                onTap: () {
                  
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void add_category(BuildContext context){
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context){
          return Padding(
            padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom,),
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height*0.28,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
                  SizedBox(height: 10,),


                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Enter Category Name",
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
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE03537),
                        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 15),
                      ),
                      child:Text("Create",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text('Items Preview', style: TextStyle(color: Colors.black)),
        bottom: Prefered_underline_appbar(),
        actions: [
          IconButton(
            icon:  Icon(Remix.store_2_line, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon:  Icon(Remix.more_2_line, color: Colors.black),
            onPressed: () {
              _showFMoreOption(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.blue.shade50,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      OutlinedButton.icon(
                        icon:  Icon(Remix.add_line,color: Colors.black,),
                        label:  Text('Categories',style: TextStyle(color: Colors.black),),
                        onPressed: () {
                          add_category(context);
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side:  BorderSide(color: Colors.grey,width: 2),
                          padding:  EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                        ),
                      ),
                       SizedBox(width: 10),
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
                                        ? Colors.red.shade50
                                        : Colors.white,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                        color: selectedCategory == category
                                            ? Color(0xFFE03537)
                                            : Colors.grey,
                                        width: 2
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                  ),
                                  child: Text(category,style: TextStyle(color: selectedCategory==category?Color(0xFFE03537):Colors.grey,fontWeight: FontWeight.bold),),
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
                  padding:  EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search items',
                        prefixIcon:  Icon(Remix.search_2_line, color: Colors.blue),
                        suffixIcon: IconButton(
                          icon:  Icon(Remix.filter_2_line, color: Colors.blue),
                          onPressed: () {
                            _showFilterOption(context);
                          },
                        ),
                        border: InputBorder.none,
                        contentPadding:  EdgeInsets.symmetric(vertical: 15),
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
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateItemPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color:  Color(0xFFE6F2FF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child:  Icon(Icons.add,
                                        color: Colors.blue, size: 30),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '₹ ${item['price']}',
                                          style: const TextStyle(
                                            fontSize: 14,
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
                                        icon: const Icon(Remix.more_2_line),
                                        onPressed: () {
                                          _showMoreOptionsOfItem(context, index);
                                        },
                                      ),
                                      Row(
                                        children: [
                                          Text('In Stock'),
                                          SizedBox(width: 10),
                                          Transform.scale(
                                            scale: 0.7,
                                            child: Switch(
                                              value: item['inStock'],
                                              onChanged: (value) {
                                                setState(() {
                                                  item['inStock'] = value;
                                                });
                                              },
                                              activeTrackColor: Colors.blueAccent,
                                              activeColor: Colors.white,
                                              inactiveTrackColor: Colors.grey.shade400,
                                              inactiveThumbColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                    backgroundColor: Color(0xFFE03537),
                  ),
                  onPressed: () {
                  },
                  child:Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Remix.add_line,color: Colors.white,size: 20,),
                      const SizedBox(width: 8),
                      Text(
                        "Add Items",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
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
