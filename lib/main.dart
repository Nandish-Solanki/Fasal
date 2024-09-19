import 'package:easy_localization/easy_localization.dart';
import 'package:fasal/Selection_page.dart';
import 'package:fasal/seller/00home/pages/home.dart';
import 'package:fasal/splashscreen/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

// Import your providers and screens
import 'Buyer/item_provider.dart';
import 'Buyer/item_selection_page.dart';
import 'Buyer/seller_list_page.dart';
import 'Buyer/chat_page.dart';
import 'Buyer/chat_provider.dart';
import 'Buyer/chat_list_page.dart';
import 'package:fasal/firebase/signin.dart'; // For authentication

// Import the combined sign-in and sign-up page
// import 'Signin-up/auth_page.dart'; // Make sure this is the correct path for your file

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
    path: 'assets/language',
    supportedLocales: [Locale('en'),Locale('hi')],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
      ],
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        title: 'FASAL',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splashscreen',
        routes: {
          '/splashscreen': (context) => const SplashScreen(),
          '/auth': (context) => AuthPage(), // Replace signIn and signUp with the combined auth page
          '/chooseRole': (context) => ChooseRolePage(),
          '/buyer': (context) => ItemSelectionPage(),
          '/seller': (context) => const HomeScreen(),
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

// Define the SettingsPage widget
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
