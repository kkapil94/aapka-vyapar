import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';


class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _Categories();
}

class _Categories extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        title: Text("Categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        bottom: Prefered_underline_appbar(),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Remix.settings_2_line)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search Category',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                        prefixIcon: Icon(Remix.search_2_line, color: Colors.blueAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:  BorderSide(color: Colors.grey,width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:  BorderSide(color: Colors.grey,width: 1),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  color: Colors.grey.shade200,
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Category Name"),
                      Text("Item Count"),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 2,
                    separatorBuilder: (context,index){
                      return Divider(color: Colors.grey.shade400,thickness: 1,);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Grocery"),
                              Text("2"),
                            ],
                          )
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
                    padding: EdgeInsets.all(14),
                    backgroundColor: Color(0xFFE03537),
                  ),
                  onPressed: () {
                  },
                  child:Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Remix.add_circle_fill,color: Colors.white,size: 20,),
                      SizedBox(width: 10),
                      Text(
                        "Add Category",
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
