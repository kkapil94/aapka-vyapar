

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Manage_Compony extends StatefulWidget {
  const Manage_Compony({super.key});

  @override
  State<Manage_Compony> createState() => _Manage_ComponyState();
}

class _Manage_ComponyState extends State<Manage_Compony> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text("Manage Componies",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        actions: [
          IconButton(
            icon: Icon(Remix.reset_left_line),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Remix.more_2_line),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.red,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3.0,
                  color: Color(0xFFE03537),
                ),
                insets: EdgeInsets.symmetric(horizontal: 120.0),
              ),
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'Sale Orders'),
                Tab(text: 'Online Orders'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Sale Orders Tab
                manage_componies(),

                // Online Orders Tab
                shared_with_we(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget manage_componies(){
  return Container(
    height: double.infinity,
    color: Colors.blue.shade50,
    child: Stack(
      children: [
        Expanded(
            child:ListView.builder(
                itemCount: 1,
                itemBuilder:(context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("Mohit Baraiya",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(onPressed: (){}, icon: Icon(Remix.more_2_line))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("mbaraiya119@gmail.com",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.grey.shade100,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                    onPressed: (){},
                                    child: Text("SYNC OFF",style: TextStyle(color: Colors.grey),)
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
            ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            children:[
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(14),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xFFE03537),width: 2),
                  ),
                  onPressed: () {

                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Remix.reset_right_line,color: Color(0xFFE03537),size: 20,),
                      SizedBox(width: 10,),
                      Text("Restore Backup ", style: TextStyle(color: Color(0xFFE03537),fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(14),
                    backgroundColor: Color(0xFFE03537),
                  ),
                  onPressed: () {

                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Deposit/Withdraw",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),

      ],
    ),
   );
  }
  Widget shared_with_we(){
    return Container();
  }
}
