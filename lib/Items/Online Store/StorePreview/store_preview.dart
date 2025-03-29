import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Store_Preview extends StatefulWidget {
  const Store_Preview({super.key});

  @override
  State<Store_Preview> createState() => _Store_PreviewState();
}

class _Store_PreviewState extends State<Store_Preview> {

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
        title:Text('Store Preview', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
        bottom: Prefered_underline_appbar(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Store Header
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohit Baraiya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  width: 80,
                  height: 80,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("Assets/Images/home.png"),
                ),
              ],
            ),
          ),
          Container(height: 10,color: Colors.grey.shade200,),

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for an item',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
          ),

          // Category Filter
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            child: Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
          ),


          // Products List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildProductCard('T-Shirt', '128421412', 550),
                _buildProductCard('Jeans', '128421412', 1200),
                _buildProductCard('Rice', '128421412', 40),
                _buildProductCard('Wheat', '128421412', 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String name, String itemCode, double price) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (categories)=>Specific_item(name,itemCode,price)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              color: Colors.grey[200],
              child: const Icon(Icons.photo, color: Colors.grey),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'ITEM CODE : $itemCode',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹ $price',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('+Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Specific_item(String name, String itemCode, double price) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text('Store Preview', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
        bottom: Prefered_underline_appbar(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: AnotherCarousel(
              images: [
                Image.network("https://5.imimg.com/data5/SELLER/Default/2023/11/363457980/JT/YE/VI/158100183/maggi-1-500x500.jpg"),
                Image.network("https://gadegal-homestay.himwebx.com/wp-content/uploads/2023/10/plain-maggie.webp"),
              ],
              dotSize: 6.0,
              dotIncreaseSize: 1.5,
              dotSpacing: 20.0,
              dotColor: Colors.grey,
              indicatorBgPadding: 5.0,
              autoplay: true,
              autoplayDuration: Duration(seconds: 3),
              boxFit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${name}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("₹ ${price}",style: TextStyle(fontSize: 15),),
                    SizedBox(
                      height: 30,
                      child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.blueAccent,)
                          ),
                          child: Text("+ Add",style: TextStyle(color: Colors.blueAccent),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(color: Colors.grey.shade200,height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About Product",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("ITEM CODE : ",style: TextStyle(fontSize: 13,color: Colors.grey.shade400),),
                        Text("79483238792",style: TextStyle(fontSize: 13),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("CATEGORY : ",style: TextStyle(fontSize: 13,color: Colors.grey.shade400),),
                        Text("GROCERY",style: TextStyle(fontSize: 13),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}