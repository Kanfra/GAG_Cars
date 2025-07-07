// messagetile.dart
import 'package:flutter/material.dart';
class Message {
  final String sender;
  final String content;
  final DateTime sentAt;
  final String image;

  Message({
    required this.sender,
    required this.content,
    required this.sentAt,
    required this.image,
  });

  String timeAgo() {
    final diff = DateTime.now().difference(sentAt);
    if (diff.inSeconds < 60) return '${diff.inSeconds}s ago';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays == 1) return 'Yesterday';
    return '${diff.inDays} days ago';
  }
}

class MessageTile extends StatelessWidget {
  final String image;
  final Message message;
  final int? unreadMessage;

  const MessageTile({
    super.key,
    required this.image,
    required this.message,
    this.unreadMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                  child: Image.asset(
                    image,fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  )
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.sender,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Text(
                  message.content,
                  style: const TextStyle(color: Colors.black26, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message.timeAgo(),
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                if (unreadMessage != null && unreadMessage! > 0)
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      unreadMessage.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10,),
        const Divider(color: Colors.black26,)
      ],
    );
  }
}











