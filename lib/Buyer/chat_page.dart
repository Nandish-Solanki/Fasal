import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_provider.dart'; // Import the ChatProvider

class ChatPage extends StatefulWidget {
  final String seller;
  final String? selectedItem;
  final Function(String) onChatCompleted; // Pass the last message as a callback

  ChatPage({
    required this.seller,
    required this.selectedItem,
    required this.onChatCompleted,
  });

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<String> _messages = [];

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
      });
      _messageController.clear();
      widget.onChatCompleted(message); // Notify when chat is completed
      _scrollToBottom(); // Scroll to the bottom when a new message is added
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  EdgeInsets _getPadding(String message) {
    // Measure text size
    final textPainter = TextPainter(
      text: TextSpan(
        text: message,
        style: TextStyle(fontSize: 16.0), // Match your TextStyle
      ),
      maxLines: null,
      textDirection: TextDirection.ltr,
    )..layout();
    
    // Calculate height of the text
    double textHeight = textPainter.size.height;
    
    // Calculate padding based on text height
    double verticalPadding = 16.0 - (textHeight / 2); // Adjust padding factor as needed
    verticalPadding = verticalPadding.clamp(8.0, 16.0); // Set minimum and maximum padding

    return EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 24.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.seller}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false, // Make the ListView start from the bottom
              controller: _scrollController, // Set the scroll controller
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: _getPadding(message),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Expanded(child: Text("message")),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Rounded corners
                            ),
                            elevation: 5, // Shadow effect
                            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Padding inside button
                          ),
                          onPressed: () {
                            // Optional: Handle button press
                          },
                          child: Text(
                            message,
                            style: TextStyle(color: Colors.white), // Text color
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
