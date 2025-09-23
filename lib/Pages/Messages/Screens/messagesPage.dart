import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GeneralComponents/AtillahComponents/messagetile.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Message> _messages = [
    Message(
      sender: 'Alice Johnson',
      image: "assets/images/photo.jpg", 
      content: 'Hello! Just checking in to see how the project is going.',
      sentAt: DateTime.now().subtract(const Duration(minutes: 3)),
      isOnline: true,
    ),
    Message(
      sender: 'Robert Chen',
      image: "assets/images/photo1.jpg", 
      content: 'How are you? Did you get a chance to review the documents?',
      sentAt: DateTime.now().subtract(const Duration(hours: 1)),
      isOnline: false,
    ),
    Message(
      sender: 'Charlie Williams',
      image: "assets/images/photo2.jpg", 
      content: 'See you tomorrow at the meeting. Don\'t forget the presentation!',
      sentAt: DateTime.now().subtract(const Duration(days: 1)),
      isOnline: true,
    ),
    Message(
      sender: 'Sarah Miller',
      image: "assets/images/photo3.jpg", 
      content: 'Thanks for your help yesterday! Really appreciate it.',
      sentAt: DateTime.now().subtract(const Duration(days: 2)),
      isOnline: false,
    ),
    Message(
      sender: 'David Kim',
      image: "assets/images/photo4.jpg", 
      content: 'The design mockups are ready for your review.',
      sentAt: DateTime.now().subtract(const Duration(days: 3)),
      isOnline: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: CustomAppbar(
          onLeadingIconClickFunction: () => Get.back(),
          isLeadingWidgetExist: true,
          leadingIconData: Icons.arrow_back_ios_new_outlined,
          titleText: "Messages",
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Handle more options
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search messages...",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.clear, color: Colors.grey[500]),
                            onPressed: () => _searchController.clear(),
                          )
                        : null,
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
            
            // Categories
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildCategory("All", true),
                  _buildCategory("Unread", false),
                  _buildCategory("Important", false),
                  _buildCategory("Groups", false),
                ],
              ),
            ),
            
            const SizedBox(height: 10),
            
            // Messages List
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: _messages.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      thickness: 1,
                      indent: 80,
                      endIndent: 20,
                      color: Colors.grey[200],
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: MessageTile(
                          image: _messages[index].image,
                          message: _messages[index],
                          unreadMessage: index == 0 ? 2 : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        
        // Floating Action Button
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.edit, color: Colors.white),
          onPressed: () {
            // Handle new message
          },
        ),
      ),
    );
  }
  
  Widget _buildCategory(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isActive ? Colors.transparent : Colors.grey[300]!,
        ),
        boxShadow: [
          if (!isActive)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
