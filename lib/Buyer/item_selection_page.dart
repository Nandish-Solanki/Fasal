import 'package:fasal/buyer/navigationdrawer.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_provider.dart'; // Import the ItemProvider
import 'chat_list_page.dart'; // Import the ChatListPage

class ItemSelectionPage extends StatefulWidget {
  @override
  _ItemSelectionPageState createState() => _ItemSelectionPageState();
}

class _ItemSelectionPageState extends State<ItemSelectionPage> {
  int _selectedIndex = 0;
  String _searchQuery = ''; // State variable for search query
  List<Map<String, String>> _filteredCrops = []; // State variable for filtered crops

  final List<Map<String, String>> crops = [
    {
      'name': 'Wheat',
      'image': 'https://5.imimg.com/data5/ST/QW/MY-38700875/fresh-wheat-crop.jpg',
      'description': 'High in carbohydrates, dietary fiber, and protein',
      'rating': '4.5',
    },
    {
      'name': 'Rice',
      'image': 'https://www.nextechagrisolutions.com/blog/wp-content/uploads/2014/11/Rice-Parts.jpg',
      'description': 'Rich in carbohydrates, moderate protein, low fat.',
      'rating': '4.2',
    },
    {
      'name': 'Maize',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShoWdSHinHRGftyKlR-C9uRHH1Z3PaWOOa3g&s',
      'description': 'Source of fiber, vitamins (A, B), and antioxidants.',
      'rating': '4.6',
    },
    {
      'name': 'Bajra',
      'image': 'https://images.herzindagi.info/image/2021/Feb/bajra-m.jpg',
      'description': 'Packed with fiber, magnesium, and protein.',
      'rating': '4.4',
    },
    {
      'name': 'Soyabean',
      'image': 'https://rukminim2.flixcart.com/image/850/1000/xif0q/plant-seed/d/g/o/500-organic-yellow-soya-bean-whole-500gm-0-5-kg-rudra-original-imagpfp7begfhv6r.jpeg?q=20&crop=false',
      'description': 'High-protein legume, rich in essential nutrients.',
      'rating': '4.9',
    },
    {
      'name': 'Sugarcane',
      'image': 'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202402/65d631e75c721-the-rs-25-per-quintal-hike-is-the-highest-by-the-modi-government-and-the-move-comes-ahead-of-the-gen-212453635-16x9.jpg',
      'description': 'High in natural sugars, provides quick energy boost.',
      'rating': '4.3',
    },
    {
      'name': 'Ragi',
      'image': 'https://i0.wp.com/dhatuorganics.com/wp-content/uploads/2023/01/ragi1.jpg?fit=1200%2C675&ssl=1',
      'description': 'High in calcium, iron, and essential amino acids.',
      'rating': '4.6',
    },
    {
      'name': 'Jowar',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7A_1JsTNSF8474SrxSX1i4dcsb9P89CpOsg&s',
      'description': 'Rich in fiber, protein, and antioxidants.',
      'rating': '4.4',
    },
    {
      'name': 'Coffee',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Roasted_coffee_beans.jpg',
      'description': 'Rich in antioxidants, caffeine boosts metabolism and energy.',
      'rating': '4.7',
    },
    {
      'name': 'Tea',
      'image': 'https://5.imimg.com/data5/XT/RH/NF/SELLER-9371693/1-500x500.jpg',
      'description': 'Contains antioxidants, polyphenols, and small amounts of caffeine.',
      'rating': '4.8',
    },
  ];

  @override
  void initState() {
    super.initState();
    _filteredCrops = crops;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  
    });
    if (index == 0) {
      // Navigate to Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ItemSelectionPage()),
      );
    } else if (index == 1) {
      // Navigate to ChatListPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatListPage()),
      );
    } else if (index == 2) {
      // Navigate to Settings
      Navigator.pushReplacementNamed(context, '/settings');
    }
  }

  void _selectCrop(String cropName) {
    context.read<ItemProvider>().selectItem(cropName);
    Navigator.pushNamed(context, '/sellerList'); // Navigate to SellerListPage
  }

  void _filterCrops(String query) {
    setState(() {
      _searchQuery = query;
      _filteredCrops = crops
          .where((crop) => crop['name']!.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      drawer: const Navigation(),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF83DCE2),
        // leading: IconButton(
        //   icon: const Icon(Icons.filter_list_sharp, color: Colors.black),
        //   onPressed: () {},
        // ),
        title: const Center(
          child: Text(
            "FASAL",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF157D84),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF83DCE2),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.34,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi Rakesh",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Let's get you your crops",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  onChanged: _filterCrops,
                  decoration: InputDecoration(
                    hintText: 'Search here...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _filteredCrops.length,
              itemBuilder: (context, index) {
                final crop = _filteredCrops[index];
                return GestureDetector(
                  onTap: () => _selectCrop(crop['name']!),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              crop['image']!,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    crop['name']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    crop['description']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow.shade900, size: 16),
                                      Text(
                                        ' ${crop['rating']}',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF83DCE2),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    ),
    );
  }
}
