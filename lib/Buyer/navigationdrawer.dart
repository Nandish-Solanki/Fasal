import 'package:fasal/signin.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  String? currentLocation;
   String _locationMessage = "Fetching location...";

    @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Location services are disabled.";
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        setState(() {
          _locationMessage = "Location permission denied.";
        });
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placemark = placemarks[0];
      setState(() {
        _locationMessage = "${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
      });
    } catch (e) {
      setState(() {
        _locationMessage = "Failed to fetch location.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color bluebg = const Color.fromARGB(255, 76, 222, 230);
    double screenHeight = MediaQuery.of(context).size.height;
    TextStyle txtstyle = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/man3.jpeg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text("Retailer's Name", style: txtstyle),
            const SizedBox(height: 10),
            
            // Display current location
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.red, size: 24),  // Location icon
                const SizedBox(width: 8),
                Text(
                  _locationMessage,
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ],
            ),
            
            const SizedBox(height: 10),
            const Divider(thickness: 1.5),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person, size: 30),
                  title: Text("Profile", style: txtstyle),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.bar_chart_sharp, size: 30),
                  title: Text("Statistics", style: txtstyle),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings, size: 30),
                  title: Text("Settings", style: txtstyle),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.23),
            BottomAppBar(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(bluebg),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),  // Replace with your SignIn screen
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.logout, color: Color.fromARGB(255, 4, 31, 54)),
                        SizedBox(width: 10),
                        Text(
                          "Logout",
                          style: TextStyle(
                            color: Color.fromARGB(255, 4, 31, 54),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
