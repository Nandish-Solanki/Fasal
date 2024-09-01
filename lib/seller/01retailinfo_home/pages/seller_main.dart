import 'package:flutter/material.dart';
import '../widgets/buyercard.dart';
import '../widgets/navigationdrawer.dart';


class SellerMain extends StatefulWidget {
  const SellerMain({super.key});

  @override
  State<SellerMain> createState() => _SellerMainState();
}

class _SellerMainState extends State<SellerMain> {
  List<Map<String, String>> buyers = [
    {'name': 'Suraj', 'imgpath': 'assets/man1.jpeg', 'desc': 'Retails in vegetables'},
    {'name': 'Ram', 'imgpath': 'assets/man2.jpeg', 'desc': 'Retails in fruits'},
    {'name': 'Rakesh', 'imgpath': 'assets/man3.jpeg', 'desc': 'Retails in millets'},
    {'name': 'Chandan', 'imgpath': 'assets/man4.jpeg', 'desc': 'Retails in cereals'},
  ];



  List<Map<String, String>> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = buyers; 
  }

  void filterSearchResults(String query) {
    List<Map<String, String>> results = [];
    if (query.isEmpty) {
      results = buyers;
    } else {
      results = buyers
          .where((buyer) =>
              buyer['name']!.toLowerCase().contains(query.toLowerCase()) ||
              buyer['desc']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenText = screenWidth * 0.05;
    Color bluebg = const Color.fromARGB(255, 76, 222, 230);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const Navigation(),
        appBar: AppBar(
          elevation: 5,
          title: const Text('Seller Dashboard'),
          centerTitle: true,
          actions: [
            Tooltip(
              message: "Refresh Page",
              child: IconButton(
                icon: const Icon(
                  Icons.refresh,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    // print("refreshed");
                  });
                },
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      color: bluebg,
                      height: screenHeight * 0.25,
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello Shyamlal,",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Let's see some new buyers in town ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenText * 1.3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SearchAnchor(
                            builder: (BuildContext context,
                                SearchController controller) {
                              return SearchBar(
                                controller: controller,
                                padding:
                                    const WidgetStatePropertyAll<EdgeInsets>(
                                        EdgeInsets.symmetric(horizontal: 16.0)),
                                onTap: () {},
                                onChanged: (query) {
                                  filterSearchResults(query);
                                },
                                leading: const Icon(Icons.search),
                                trailing: <Widget>[],
                              );
                            },
                            viewBackgroundColor: Colors.white,
                            suggestionsBuilder: (BuildContext context,
                                SearchController controller) {
                              return List<ListTile>.generate(
                                  searchResults.length, (int index) {
                                final buyer = searchResults[index];
                                return ListTile(
                                  title: Text(buyer['name']!),
                                  subtitle: Text(buyer['desc']!),
                                  onTap: () {
                                  
                                    setState(() {
                                      controller.closeView(buyer['name']);
                                    }
                                    );
                                  },
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ...searchResults.map((buyer) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Buyercard(
                      rname: buyer['name']!,
                      imgpath: buyer['imgpath']!,
                      rdesc: buyer['desc']!, 
                      rating: '4',
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
