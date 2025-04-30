// import 'package:flutter/material.dart';
//
// class HelpCenterPage extends StatefulWidget {
//   const HelpCenterPage({super.key});
//
//   @override
//   State<HelpCenterPage> createState() => _HelpCenterPageState();
// }
//
// class _HelpCenterPageState extends State<HelpCenterPage> with SingleTickerProviderStateMixin{
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose(){
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return  SafeArea(
//         child:Scaffold(
//           body: SingleChildScrollView(
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               child: Column(
//               children: [
//                 Row(
//                   children: [
//                     const Icon(Icons.arrow_back_ios_new),
//                     SizedBox(width:size.width*0.22),
//                     const Center(child: Text("Help Center",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
//                   ],
//                 ),
//                 const SizedBox(height: 20,),
//                 //  Column(
//                 //    children: [
//                 //      TabBar(
//                 //        labelColor: Colors.black,
//                 //        unselectedLabelColor: Colors.black26,
//                 //        indicator: const UnderlineTabIndicator(
//                 //          borderSide: BorderSide(width: 2,color: Colors.black),
//                 //          insets: EdgeInsets.symmetric(horizontal: 20)
//                 //        ),
//                 //
//                 //
//                 //        isScrollable: true,
//                 //        labelStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
//                 //
//                 //      controller: _tabController,
//                 //         tabs:  const [
//                 //       Tab(text: "FAQ",),
//                 //       Tab(text: "Contact Us",),
//                 //
//                 // ]),
//                 //
//                 //    ],
//                 //  )
//
//                 //test
//
//                 Expanded(
//                   child: Column(
//                     children: [
//                       // Custom-styled tab headers with lines below
//                       SizedBox(
//                         height: 70,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () => _tabController.animateTo(0),
//                                   child: Text(
//                                     'FAQ',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: _tabController.index == 0 ? Colors.black : Colors.black26,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 6),
//                                 Container(height: 2, width: 130, color: Colors.grey.shade300),
//                                 Container(height: 2, width: 130, color: _tabController.index == 0 ? Colors.blue : Colors.transparent),
//                               ],
//                             ),
//                             const SizedBox(width: 20),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () => _tabController.animateTo(1),
//                                   child: Text(
//                                     'Contact Us',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: _tabController.index == 1 ? Colors.black : Colors.black26,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 6),
//                                 Container(height: 2, width: 130, color: Colors.grey.shade300),
//                                 Container(height: 2, width: 130, color: _tabController.index == 1 ? Colors.blue : Colors.transparent),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // Tab Views
//                       Expanded(
//                         child: TabBarView(
//                           controller: _tabController,
//                           children: const [
//                             Center(child: Text('FAQ Content')),
//                             Center(child: Text('Contact Us Content')),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//
//
//               ],
//               ),
//             ),
//           ),
//         )
//     );
//   }
// }


//test


import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/contactUsPage.dart';
import 'package:gag_cars_frontend/Pages/Profile%20Pages/Screens/faqPage.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // This updates the tab styling when selected
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios_new),
                  SizedBox(width: size.width * 0.22),
                  const Text(
                    "Help Center",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),

            // Custom Tab Header
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTabHeader("FAQ", 0),
                  const SizedBox(width: 20),
                  _buildTabHeader("Contact Us", 1),
                ],
              ),
            ),

            // TabBarView content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  FaqPage(),
                  ContactUsPage()
                  // Center(child: Text('FAQ Content')),
                  // Center(child: Text('Contact Us Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabHeader(String title, int index) {
    bool isSelected = _tabController.index == index;

    return GestureDetector(
      onTap: () => _tabController.animateTo(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.black26,
            ),
          ),
          const SizedBox(height: 6),
          Container(height: 2, width: 130, color:  isSelected ? Colors.transparent : Colors.black26),
          Container(height: 2, width: 130, color: isSelected ? Colors.black : Colors.transparent),
        ],
      ),
    );
  }
}
