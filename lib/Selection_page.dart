import 'package:fasal/Buyer/item_selection_page.dart';
import 'package:fasal/seller/00home/pages/home.dart';
import 'package:flutter/material.dart';
// import 'home.dart'; // Your existing seller home screen
// import 'item_selection_page.dart'; // Your existing buyer item selection page

// Define the ChooseRolePage widget
class ChooseRolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF83DCE2),
        
        title: const Text('Choose Your Role'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(const Color(0xFF83DCE2)),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/buyer');
              },
              child: const Text('Retailer', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(const Color(0xFF83DCE2)),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/seller');
              },
              child: const Text('Farmer',style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

class RoleSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Role'),
        backgroundColor: Color(0xFF83DCE2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                backgroundColor: Color(0xFF157D84),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text(
                'I am a Farmer',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                backgroundColor: Color(0xFF157D84),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ItemSelectionPage()),
                );
              },
              child: Text(
                'I am a Retailer',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
