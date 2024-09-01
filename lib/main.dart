import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Buyer/item_provider.dart';
import 'Buyer/item_selection_page.dart';
import 'Buyer/seller_list_page.dart';
import 'Buyer/chat_page.dart';
import 'Buyer/chat_provider.dart';
import 'Buyer/chat_list_page.dart';
import 'seller/00home/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
      ],
      child: MaterialApp(
        title: 'FASAL',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/chooseRole',
        routes: {
          '/chooseRole': (context) => ChooseRolePage(),
          '/buyer': (context) => ItemSelectionPage(),
          '/seller': (context) => HomeScreen(),
          '/sellerList': (context) => SellerListPage(),
          '/chatList': (context) => ChatListPage(),
          '/chat': (context) {
            final sellerName = ModalRoute.of(context)!.settings.arguments as String;
            return ChatPage(
              seller: sellerName,
              selectedItem: Provider.of<ItemProvider>(context).selectedItem,
              onChatCompleted: (lastMessage) {
                final chatProvider = Provider.of<ChatProvider>(context, listen: false);
                chatProvider.addChat({
                  'name': sellerName,
                  'lastMessage': lastMessage,
                  'avatar': 'https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg',
                });
              },
            );
          },
          '/settings': (context) => SettingsPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ChooseRolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Role'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/buyer');
              },
              child: Text('Buyer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/seller');
              },
              child: Text('Seller'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
