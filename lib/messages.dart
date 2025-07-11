import 'package:flutter/material.dart';
import 'chat_page.dart';

class MessagingHome extends StatelessWidget {
  const MessagingHome({super.key});

  final List<Map<String, String>> chats = const [
    {'name': 'Official App', 'id': 'official'},
    {'name': 'Alice', 'id': 'alice'},
    {'name': 'Bob', 'id': 'bob'},
    {'name': 'Charlie', 'id': 'charlie'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            title: Text(chat['name']!),
            leading: const CircleAvatar(child: Icon(Icons.person)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => ChatPage(
                        userId: chat['id']!,
                        userName: chat['name']!,
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
