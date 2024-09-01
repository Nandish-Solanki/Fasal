import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ItemsListed extends StatefulWidget {
  ItemsListed({super.key});

  @override
  State<ItemsListed> createState() => _ItemsListedState();
}

class _ItemsListedState extends State<ItemsListed> {
  List<String> cropNames = ["Tomato", "Onions", "Wheat"];
  List<String> cropQuantities = ["50", "60", "40"];
  List<String> cropPrices = ["100", "200", "300"];
  List<String> cropimg = [
    "assets/tomato.jpeg",
    "assets/onion.jpeg",
    "assets/wheat2.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Color bluebg = const Color.fromARGB(255, 76, 222, 230);
    

    TextStyle cropDeets = const TextStyle(
      color: Color.fromARGB(255, 40, 39, 39),
      fontSize: 17,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Your Listed Items',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: cropNames.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: screenWidth,
                      height: screenHeight * 0.15,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              cropimg[index],
                              fit: BoxFit.cover,
                              height: screenHeight * 0.15,
                              width: screenWidth * 0.4,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cropNames[index],
                                  style: cropDeets,
                                ),
                                Text(
                                  "Price: ₹${cropPrices[index]}",
                                  style: cropDeets,
                                ),
                                Text(
                                  "Quantity: ${cropQuantities[index]} kg",
                                  style: cropDeets,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle, color: Color.fromARGB(255, 217, 32, 32)),
                            onPressed: () {
                              setState(() {
                                cropNames.removeAt(index);
                                cropPrices.removeAt(index);
                                cropQuantities.removeAt(index);
                                cropimg.removeAt(index); // Remove image path too
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
          FloatingActionButton(
            backgroundColor: bluebg,
            child: const Icon(Icons.add, color: Colors.black, size: 35),
            onPressed: () {
              showAddCropDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void showAddCropDialog(BuildContext context) {
    final _nameController = TextEditingController();
    final _priceController = TextEditingController();
    final _quantityController = TextEditingController();
    File? _selectedimg;

    Future<void> _pickimgfromgallery() async {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _selectedimg = File(pickedFile.path);
        });
      }
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Crop"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Crop Name"),
                ),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: "Price(per kg)"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _quantityController,
                  decoration: const InputDecoration(labelText: "Quantity(in kg)"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 76, 222, 230)),
                  ),
                  onPressed: _pickimgfromgallery,
                  child: const Icon(Icons.photo)
                ),
                _selectedimg != null
                    ? Expanded(
                      child: Image.file(
                          _selectedimg!,
                          width: 10,
                          height: 10,
                          fit: BoxFit.cover,
                        ),
                    )
                    : const Text("Please select an image"),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Add"),
              onPressed: () {
                final name = _nameController.text.trim();
                final price = _priceController.text.trim();
                final quantity = _quantityController.text.trim();

                if (name.isNotEmpty && price.isNotEmpty && quantity.isNotEmpty) {
                  setState(() {
                    cropNames.add(name);
                    cropPrices.add(price);
                    cropQuantities.add(quantity);
                    cropimg.add(_selectedimg?.path ?? 'assets/vegfruits.jpeg'); 
                  });
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
