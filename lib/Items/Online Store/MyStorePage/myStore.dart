import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:demo/Items/Online%20Store/Edit%20Store%20Info/edit-store-info.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../Manage Items Screen/manage-items-screen.dart';
import '../OrderScreen/OrderScreen.dart';
import '../StorePreview/store_preview.dart';

class OnlineStoreScreen extends StatefulWidget {
  const OnlineStoreScreen({super.key});

  @override
  State<OnlineStoreScreen> createState() => _OnlineStoreScreenState();
}

class _OnlineStoreScreenState extends State<OnlineStoreScreen>{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool acceptOrders = true;
  bool minOrderAmount = false;
  bool additionalCharges = true;
  bool itemDiscounts = false;
  bool linkStock = false;

  bool deliveryCharges = false;
  bool addTaxes = false;
  bool extraDeliveryCharges = false;

  @override
  Widget build(BuildContext context) {

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Store Settings",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              Divider(color: Colors.grey.shade200),

              // Accept Online Orders
              Transform.scale(
                scale: 0.9,
                child: SwitchListTile(
                  title: Text("Accept Online Orders", style: TextStyle(fontSize: 18)),
                  value: acceptOrders,
                  onChanged: (value) {
                    setState(() {
                      acceptOrders = value;
                    });
                  },
                  activeTrackColor: Colors.blueAccent,
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),

              // Set Min Order Amount
              Transform.scale(
                scale: 0.9,
                child: SwitchListTile(
                  title: Text("Set Min Order Amount", style: TextStyle(fontSize: 18)),
                  value: minOrderAmount,
                  onChanged: (value) {
                    setState(() {
                      minOrderAmount = value;
                    });
                  },
                  activeTrackColor: Colors.blueAccent,
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),

              // Additional Charges
              Container(
                color: Colors.grey.shade200,
                child: Column(
                  children: [

                    Transform.scale(
                      scale: 0.9,
                      child: SwitchListTile(
                        title: Text("Additional Charges", style: TextStyle(fontSize: 18)),
                        value: additionalCharges,
                        onChanged: (value) {
                          setState(() {
                            additionalCharges = value;
                          });
                        },
                        activeTrackColor: Colors.blueAccent,
                        activeColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),

                    if (additionalCharges) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 0.9,
                              child: Checkbox(
                                value: deliveryCharges,
                                onChanged: (value) {
                                  setState(() {
                                    deliveryCharges = value!;
                                  });
                                },
                                activeColor: Colors.blue,
                              ),
                            ),
                            Text("Delivery Charges", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 0.9,
                              child: Checkbox(
                                value: addTaxes,
                                onChanged: (value) {
                                  setState(() {
                                    addTaxes = value!;
                                  });
                                },
                                activeColor: Colors.blue,
                              ),
                            ),
                            Text("Add Taxes into Cart Value", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 0.9,
                              child: Checkbox(
                                value: extraDeliveryCharges,
                                onChanged: (value) {
                                  setState(() {
                                    extraDeliveryCharges = value!;
                                  });
                                },
                                activeColor: Colors.blue,
                              ),
                            ),
                            Text("Extra Delivery Charges", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),


              // Item Discounts
              Transform.scale(
                scale: 0.9,
                child: SwitchListTile(
                  title: Text("Item Discounts", style: TextStyle(fontSize: 18)),
                  value: itemDiscounts,
                  onChanged: (value) {
                    setState(() {
                      itemDiscounts = value;
                    });
                  },
                  activeTrackColor: Colors.blueAccent,
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),

              Transform.scale(
                scale: 0.9,
                child: SwitchListTile(
                  title: Text("Link Stock to Online Store", style: TextStyle(fontSize: 18)),
                  value: linkStock,
                  onChanged: (value) {
                    setState(() {
                      linkStock = value;
                    });
                  },
                  activeTrackColor: Colors.blueAccent,
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),

              // Apply Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Text(
                      "Apply",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title:Text("Online Store",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        bottom: Prefered_underline_appbar(),
        actions: [
          IconButton(
            icon: Icon(Remix.eye_line, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Store_Preview()),
              );
            },
          ),
          IconButton(
            icon: Icon(Remix.settings_2_line, color: Colors.black),
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer(); // Open Right Drawer
            },
          ),
        ],
      ),
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade50, Colors.orange.shade400],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("mohit_store",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,fontSize: 18),),
                              Text("+Add description",style: TextStyle(color: Colors.grey,fontSize: 12),),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Edit_store_info()));
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Remix.pencil_line,color: Colors.blueAccent,size: 12,),
                                        Text("Edit store info",style: TextStyle(color: Colors.blueAccent,fontSize: 12),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                      child: VerticalDivider()
                                  ),
                                  Row(
                                    children: [
                                      Icon(Remix.global_line,color: Colors.blueAccent,size: 12,),
                                      Text("Get your own website",style: TextStyle(color: Colors.blueAccent,fontSize: 12),),
                                    ],
                                  ),
          
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 65,
                            width: 65,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: Image.asset("Assets/Images/home.png"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Share store link & get more orders online",style: TextStyle(color: Color(0xFFE03537),fontWeight: FontWeight.bold,fontSize: 15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE03537),
                        ),
                        child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Remix.share_forward_line,color: Colors.white,)),
                          Text("Share Online Store",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                        ],
                      )),
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: screenheight*0.01,),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Orders",style: TextStyle(fontSize: 16),),
                              Text("0",style: TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenwidth*0.01,),
                    Expanded(
                      child:GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Open Orders",style: TextStyle(fontSize: 16),),
                              Text("0",style: TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Store View",style: TextStyle(fontSize: 16),),
                            Text("11",style: TextStyle(fontSize: 16),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: screenwidth*0.01,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order value Received",style: TextStyle(fontSize: 16),),
                            Text("0",style: TextStyle(fontSize: 16),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: screenwidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Quick Actions",style: TextStyle(fontSize: 15),),
                      ),
                      Divider(color: Colors.grey.shade200,thickness: 1,),
                      ///Manage Items
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageItemsPage()));
                            },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade50,
                                      borderRadius: BorderRadius.circular(90),
                                    ),
                                    child: Icon(Remix.box_3_line,size: 30,color: Colors.orange.shade800,),
                                  ),
                                  SizedBox(width: screenwidth*0.04,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Manage Items",style: TextStyle(fontSize: 15),),
                                      Text("Total items added - 10"),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Remix.arrow_right_s_line,color: Colors.blueAccent,),
                            ],
                          ),
                        ),
                      ),
                      Divider(color: Colors.grey.shade200,thickness: 1,),
                      ///Manage Orders
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade50,
                                      borderRadius: BorderRadius.circular(90),
                                    ),
                                    child: Icon(Remix.truck_line,size: 30,color: Color(0xFFE03537),),
                                  ),
                                  SizedBox(width: screenwidth*0.04,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Manage Orders",style: TextStyle(fontSize: 15),),
                                      Text("Order delivered till date - 0"),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Remix.arrow_right_s_line,color: Colors.blueAccent,),
                            ],
                          ),
                        ),
                      ),
                      Divider(color: Colors.grey.shade200,thickness: 1,),
                      ///Store Reports
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: Icon(Remix.survey_line,size: 30,color: Colors.blueAccent,),
                                ),
                                SizedBox(width: screenwidth*0.04,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Store Reports",style: TextStyle(fontSize: 15),),
                                    Text("Total items added - 10"),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Remix.arrow_right_s_line,color: Colors.blueAccent,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildStatCard(
  //     String title, String value, BuildContext context, VoidCallback onTap) {
  //   return Expanded(
  //     child: GestureDetector(
  //       onTap: onTap,
  //       child: Container(
  //         padding: const EdgeInsets.all(16),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               title,
  //               style:
  //                   const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  //             ),
  //             const SizedBox(height: 8),
  //             Text(
  //               value,
  //               style:
  //                   const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildActionItem(
  //   BuildContext context, {
  //   required IconData icon,
  //   required Color iconColor,
  //   required Color iconBgColor,
  //   required String title,
  //   required String subtitle,
  //   required VoidCallback onTap,
  // }) {
  //   return InkWell(
  //     onTap: onTap,
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
  //       child: Row(
  //         children: [
  //           Container(
  //             width: 48,
  //             height: 48,
  //             decoration: BoxDecoration(
  //               color: iconBgColor,
  //               shape: BoxShape.circle,
  //             ),
  //             child: Icon(icon, color: iconColor, size: 24),
  //           ),
  //           const SizedBox(width: 16),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   title,
  //                   style: const TextStyle(
  //                       fontSize: 18, fontWeight: FontWeight.w500),
  //                 ),
  //                 const SizedBox(height: 4),
  //                 Text(
  //                   subtitle,
  //                   style: const TextStyle(color: Colors.grey, fontSize: 14),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           const Icon(Icons.chevron_right, color: Colors.grey),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
