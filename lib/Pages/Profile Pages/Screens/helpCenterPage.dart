import 'package:flutter/material.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SafeArea(
        child:Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.arrow_back_ios_new),
                    SizedBox(width:size.width*0.22),
                    const Center(child: Text("Help Center",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
                  ],
                ),
                const SizedBox(height: 20,),
                 Column(
                   children: [
                     TabBar(
                       labelColor: Colors.black,
                       unselectedLabelColor: Colors.black26,


                       isScrollable: true,
                       labelStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),

                     controller: _tabController,
                        tabs:  [
                      Padding(
                        padding: EdgeInsets.only(right: size.width * 1/8),
                        child: const Tab(text: "FAQ",),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: size.width * 1/8),
                        child: const Tab(text: "Contact Us",),
                      )
                ]),

                   ],
                 )


              ],
              ),
            ),
          ),
        )
    );
  }
}
