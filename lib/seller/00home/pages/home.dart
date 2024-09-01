import 'package:fasal/seller/03chatseller/pages/allchats.dart';
import 'package:flutter/material.dart';
// import 'package:sihfasal/seller/03chatseller/pages/allchats.dart';

import '../../02additems/pages/itemslisted.dart';
import '../../01retailinfo_home/pages/seller_main.dart';
import '../widgets/bottomnav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _currentPageIndex = ValueNotifier<int>(0);

  final _destinations = const [
    BottomNavigationIcon(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: "Home",
    ),
    BottomNavigationIcon(
      icon: Icons.add_box_outlined,
      selectedIcon: Icons.add_box,
      label: "Add item",
    ),
    BottomNavigationIcon(
      icon: Icons.chat_outlined,
      selectedIcon: Icons.chat,
      label: "Chats",
    ),
  ];

  final List<Widget> _screens = [
    SellerMain(),
    ItemsListed(), // Keep state intact
    Allchats()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _currentPageIndex,
        builder: (context, index, _) {
          return IndexedStack(
            index: index,
            children: _screens,
          );
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        child: ValueListenableBuilder<int>(
          valueListenable: _currentPageIndex,
          builder: (context, index, _) {
            return NavigationBar(
              destinations: _destinations,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              selectedIndex: index,
              indicatorColor: Colors.transparent,
              onDestinationSelected: (index) {
                _currentPageIndex.value = index;
              },
            );
          },
        ),
      ),
    );
  }
}
