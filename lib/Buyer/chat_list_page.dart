import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_provider.dart';
import 'item_selection_page.dart';
// import 'settings_page.dart'; // Import your SettingsPage if it's in a separate file

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  int _selectedIndex = 1; // Index for BottomNavigationBar
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      // Navigate to ItemSelectionPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ItemSelectionPage()),
      );
    } else if (index == 1) {
      // Stay on ChatListPage
    } else if (index == 2) {
      // Navigate to Settings
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ItemSelectionPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat List'),
        backgroundColor: Color(0xFF83DCE2),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color to white
                borderRadius: BorderRadius.circular(30.0), // Match the ItemSelectionPage
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search chats...',
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          // Retrieve and sort the chat list by the timestamp of the last message
          final chatList = chatProvider.chats;

          // Filter the chat list based on the search query
          final filteredChatList = chatList.where((chat) {
            final name = chat['name']?.toLowerCase() ?? '';
            return name.contains(_searchQuery.toLowerCase());
          }).toList();

          filteredChatList.sort((a, b) {
            final dateA = DateTime.tryParse(a['lastMessageTimestamp'] ?? '') ?? DateTime(1970);
            final dateB = DateTime.tryParse(b['lastMessageTimestamp'] ?? '') ?? DateTime(1970);
            return dateB.compareTo(dateA); // Descending order
          });

          return ListView.builder(
            itemCount: filteredChatList.length,
            itemBuilder: (context, index) {
              final chat = filteredChatList[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(chat['avatar']!),
                ),
                title: Text(chat['name']!),
                subtitle: Text(chat['lastMessage'] ?? 'No messages yet'),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/chat',
                    arguments: chat['name'],
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF83DCE2),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
