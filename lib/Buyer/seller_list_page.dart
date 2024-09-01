import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_provider.dart'; // Import the ItemProvider
import 'chat_provider.dart'; // Import the ChatProvider
import 'chat_page.dart'; // Import the ChatPage
import 'item_selection_page.dart'; // Import the ItemSelectionPage

class SellerListPage extends StatefulWidget {
  @override
  _SellerListPageState createState() => _SellerListPageState();
}

class _SellerListPageState extends State<SellerListPage> {
  List<Map<String, dynamic>> filteredSellers = [];
  int _selectedIndex = 0; // Index for BottomNavigationBar

  @override
  void initState() {
    super.initState();
    final selectedItem = context.read<ItemProvider>().selectedItem;
    filteredSellers = getSellersForItem(selectedItem);
  }

  void _filterSellers(String query) {
    final selectedItem = context.read<ItemProvider>().selectedItem;
    final sellers = getSellersForItem(selectedItem);
    setState(() {
      filteredSellers = sellers
          .where((seller) => seller['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showSellerOptions(Map<String, dynamic> seller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Options for ${seller['name']}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      seller: seller['name'],
                      selectedItem: context.read<ItemProvider>().selectedItem,
                      onChatCompleted: (lastMessage) {
                        // Update chat provider with the last message
                        final chatProvider = Provider.of<ChatProvider>(context, listen: false);
                        chatProvider.addMessageToChat(
                          seller['name'],
                          lastMessage,
                        );
                      },
                    ),
                  ),
                );
              },
              child: Text('Chat'),
            ),
            TextButton(
              onPressed: () {
                _showPriceDialog(seller);
              },
              child: Text('Negotiate'),
            ),
          ],
        );
      },
    );
  }

  void _showPriceDialog(Map<String, dynamic> seller) {
    final _priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Price for ${seller['name']}'),
          content: TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Price',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final price = _priceController.text;
                if (price.isNotEmpty) {
                  // Send automated message to seller
                  final chatProvider = Provider.of<ChatProvider>(context, listen: false);
                  chatProvider.addMessageToChat(
                    seller['name'],
                    'Price offered: $price',
                  );
                  Navigator.of(context).pop(); // Close the dialog
                }
              },
              child: Text('Send'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
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
      // Navigate to ChatListPage
      Navigator.pushReplacementNamed(context, '/chatList');
    } else if (index == 2) {
      // Navigate to Settings
      Navigator.pushReplacementNamed(context, '/settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedItem = context.watch<ItemProvider>().selectedItem;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF83DCE2),
        title: Text(
          'Sellers of $selectedItem',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF83DCE2),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            padding: EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _filterSellers,
                decoration: InputDecoration(
                  labelText: 'Search Sellers',
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSellers.length,
              itemBuilder: (context, index) {
                final seller = filteredSellers[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(seller['avatar']),
                      ),
                      title: Text(seller['name']),
                      subtitle: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(seller['rating'].toString()),
                          SizedBox(width: 16),
                          Icon(Icons.location_on, color: Colors.grey, size: 16),
                          SizedBox(width: 4),
                          Text(seller['location']),
                        ],
                      ),
                      onTap: () {
                        _showSellerOptions(seller);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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

  List<Map<String, dynamic>> getSellersForItem(String? item) {
    // Mock data: Normally, this data would be fetched from a server or database
    final Map<String, List<Map<String, dynamic>>> sellerData = {
      'Wheat': [
        {'name': 'Shyamlal', 'rating': 4.5, 'location': 'Location A', 'avatar': 'https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg'},
        {'name': 'Ramlal', 'rating': 4.0, 'location': 'Location B', 'avatar': 'https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg'},
        {'name': 'Mithulal', 'rating': 4.7, 'location': 'Location C', 'avatar': 'https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg'},
      ],
      'Rice': [
         {'name': 'Hira', 'rating': 4.3, 'location': 'Location F', 'avatar': 'https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg'},
        {'name': 'Lakhan', 'rating': 4.2, 'location': 'Location X', 'avatar': 'https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg'},
        {'name': 'johny', 'rating': 4.1, 'location': 'Location B', 'avatar': 'https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg'},
      ]
      // Add more mock data for other items as needed
    };

    return sellerData[item] ?? [];
  }
}
