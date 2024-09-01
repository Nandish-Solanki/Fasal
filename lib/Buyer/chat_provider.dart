import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  List<Map<String, String>> _chats = [];

  List<Map<String, String>> get chats => _chats;

  void addMessageToChat(String sellerName, String message) {
    final existingChat = _chats.firstWhere(
      (chat) => chat['name'] == sellerName,
      orElse: () => {},
    );

    if (existingChat.isNotEmpty) {
      // Update existing chat
      existingChat['lastMessage'] = message;
      existingChat['lastMessageTimestamp'] = DateTime.now().toIso8601String();
    } else {
      // Add new chat
      _chats.add({
        'name': sellerName,
        'lastMessage': message,
        'lastMessageTimestamp': DateTime.now().toIso8601String(),
        'avatar': 'https://example.com/default-avatar.jpg', // Use a default or a dynamic URL
      });
    }

    // Sort chats by the timestamp of the last message, newest first
    _chats.sort((a, b) {
      final dateA = DateTime.tryParse(a['lastMessageTimestamp'] ?? '') ?? DateTime(1970);
      final dateB = DateTime.tryParse(b['lastMessageTimestamp'] ?? '') ?? DateTime(1970);
      return dateB.compareTo(dateA);
    });

    notifyListeners();
  }

  void addChat(Map<String, String> map) {}
}
