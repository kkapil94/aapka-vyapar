import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

import '../../Dashboard/Item/Add_Items_to_Unit.dart';
import '../../Dashboard/Item/Set_Conversion.dart';

class Units extends StatefulWidget {
  const Units({super.key});

  @override
  State<Units> createState() => _UnitsState();
}

class _UnitsState extends State<Units> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        title: Text("Units",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        bottom: Prefered_underline_appbar(),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Remix.settings_2_line)),
        ],
      ),
      backgroundColor: Colors.white,
      body:Container(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Set_Conversion()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade50
                              ),
                              child: Text("Set Conversion",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),)
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Items_To_Unit()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade50
                              ),
                              child: Text("Unit to Items",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),)
                          ),
                        )
                      ]
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 3,
                    separatorBuilder: (context,index){
                      return Divider(color: Colors.grey.shade400,thickness: 1,);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.white,
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.only(left: 16),
                          visualDensity: VisualDensity(vertical: -4),
                          title: Text("Bags"),
                          subtitle: Text("Bag"),
                          trailing: IconButton(onPressed: (){}, icon: Icon(Remix.pencil_line)),
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
                        "Add Unit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ) ,
    );
  }
}
