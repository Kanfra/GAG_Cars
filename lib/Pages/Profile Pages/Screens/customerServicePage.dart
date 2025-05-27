import 'package:flutter/material.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';

class CustomerServicePage extends StatefulWidget {
  const CustomerServicePage({Key? key}) : super(key: key);

  @override
  State<CustomerServicePage> createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
  final List<Message> _messages = [
    Message(
        text: "Hello!",
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(days: 1))),
    Message(text: "Hi, how are you?", isMe: true, timestamp: DateTime.now()),
  ];

  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _handleSendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        Message(text: text, isMe: true, timestamp: DateTime.now()),
      );
    });
    _textController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool _isNewDate(int index) {
    if (index == 0) return true;
    final current = _messages[index].timestamp;
    final previous = _messages[index - 1].timestamp;
    return current.year != previous.year ||
        current.month != previous.month ||
        current.day != previous.day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(onLeadingIconClickFunction: (){},
          isLeadingWidgetExist: true,
          leadingIconData: Icons.arrow_back,
          titleText: "Customer Service",
           centerTitle: true,
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.phone_outlined,color: Colors.black)
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              // padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
              child: const Icon(Icons.more_horiz_rounded,color: Colors.black,),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    List<Widget> widgets = [];

                    if (_isNewDate(index)) {
                      widgets.add(_DateHeader(date: _messages[index].timestamp));
                    }

                    widgets.add(ChatBubble(message: _messages[index]));

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: widgets,
                    );
                  },
                ),
              ),
              _MessageInputField(
                controller: _textController,
                onSend: _handleSendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Message Model ---
class Message {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}

// --- Chat Bubble Widget ---
class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    final bgColor =
    isMe ? Colors.black54.withOpacity(0.7) : Colors.grey[300];
    final align = isMe ? Alignment.centerRight : Alignment.centerLeft;
    final radius = isMe
        ? const BorderRadius.only(
      topLeft: Radius.circular(12),
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12)
    )
        : const BorderRadius.only(
      topRight: Radius.circular(12),
      bottomRight: Radius.circular(12),
      bottomLeft: Radius.circular(12)
      
    );

    return Align(
      alignment: align,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: radius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.text,
              style:  TextStyle(fontSize: 16,color: isMe? Colors.white : Colors.black),
            ),
            const SizedBox(height: 4),
            Text(
              _formatTimestamp(message.timestamp),
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _formatTimestamp(DateTime timestamp) {
    final hours = timestamp.hour.toString().padLeft(2, '0');
    final minutes = timestamp.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }
}

// --- Message Input Field Widget ---
class _MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _MessageInputField({
    Key? key,
    required this.controller,
    required this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.white,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                textCapitalization: TextCapitalization.sentences,
                decoration:  InputDecoration(
                  hintText: 'message...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                suffixIcon: GestureDetector(
                  onTap: (){},
                    child: const Icon(Icons.photo,color: Colors.black,)
                )

                ),

              ),
            ),
           const SizedBox(width: 25,),
            const CircleAvatar(
              radius: 15,
                backgroundColor: Colors.black54,
                child: Icon(Icons.mic_none,color: Colors.white,)
            )
          ],
        ),
      ),
    );
  }
}



// --- Date Header Widget ---
class _DateHeader extends StatelessWidget {
  final DateTime date;

  const _DateHeader({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    String text;
    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      text = 'Today';
    } else if (messageDate == yesterday) {
      text = 'Yesterday';
    } else {
      text = "${date.day}/${date.month}/${date.year}";
    }

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ),
    );
  }
}



