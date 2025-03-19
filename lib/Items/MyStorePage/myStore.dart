import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:demo/Items/Edit%20Store%20Info/edit-store-info.dart';
import 'package:demo/Items/Manage%20Items%20Screen/manage-items-screen.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../OrderScreen/OrderScreen.dart';
import '../StorePreview/store_preview.dart';

class OnlineStoreScreen extends StatelessWidget {
  const OnlineStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title:Text("Online Store",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        bottom: Prefered_underline_appbar(),
        actions: [
          IconButton(
            icon: Icon(Icons.visibility, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StorePreviewScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
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
                      Divider(color: Colors.grey.shade200,thickness: 1,),
                      ///Manage Orders
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
