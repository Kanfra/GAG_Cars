
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
  final TextEditingController searchBar = TextEditingController();

  final List<Message> messages = [
    Message(sender: 'Alice',image: "assets/images/photo.jpg", content: 'Hello!', sentAt: DateTime.now().subtract(const Duration(minutes: 3))),
    Message(sender: 'Bob',image: "assets/images/photo1.jpg", content: 'How are you?', sentAt: DateTime.now().subtract(const Duration(hours: 1))),
    Message(sender: 'Charlie',image: "assets/images/photo2.jpg", content: 'See you tomorrow.', sentAt: DateTime.now().subtract(const Duration(days: 1))),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          onLeadingIconClickFunction: () {
            Get.back();
          },
          isLeadingWidgetExist: true,
          leadingIconData: Icons.arrow_back_ios_new_outlined,
          titleText: "Messages",
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
          child: Column(
            children: [
              TextFormField(
                controller: searchBar,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search_outlined),
                  prefixIconColor: Colors.black,
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: MessageTile(
                        image: messages[index].image,
                        message: messages[index],
                        unreadMessage: index == 0 ? 2 : null,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

