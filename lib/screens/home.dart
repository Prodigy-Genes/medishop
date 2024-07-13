import 'package:flutter/material.dart';
import 'package:medishop/screens/popularitem_card.dart';
import 'package:medishop/widgets/bottom_navigation.dart';
import 'package:medishop/widgets/card_row.dart';
import 'package:medishop/widgets/location_icon.dart';
import 'package:medishop/widgets/recently_viewed.dart';
import 'package:medishop/widgets/search_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              LocationDisplay(
                onLocationPressed: () {
                  print("Location has been pressed");
                },
              ),
              const SizedBox(height: 8),
              Search_Bar(
                controller: _searchController,
                onChanged: (query) {
                  print('Search query: $query');
                },
              ),
              const SizedBox(height: 8),
              CardRow(
                onMedicationPressed: () {
                  print("Medication has been pressed");
                },
                onMyOrdersPressed: () {
                  print("My Orders has been pressed");
                },
                onSupportChatPressed: () {
                  print("Support Chat has been pressed");
                },
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular items",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print("See all");
                    },
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Set fixed width for each card
                    SizedBox(
                      width: 200,
                      child: PopularItemCard(
                        imagePath: "assets/images/drug1.png",
                        title: "itemName",
                        description: "itemDescription",
                        price: 7.00,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 200,
                      child: PopularItemCard(
                        imagePath: "assets/images/drug1.png",
                        title: "itemName",
                        description: "itemDescription",
                        price: 7.00,
                      ),
                    ),
                    // Add more items as needed
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recently viewed products",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {
                        print("See all");
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ))
                ],
              ),
              const SizedBox(height: 5),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Set fixed width for each card
                    SizedBox(
                      width: 200,
                      child: RecentlyViewed(
                        imagePath: "assets/images/drug2.png",
                        title: "itemName",
                        description: "itemDescription",
                        price: 7.00,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 200,
                      child: RecentlyViewed(
                        imagePath: "assets/images/drug2.png",
                        title: "itemName",
                        description: "itemDescription",
                        price: 7.00,
                      ),
                    ),
                    // Add more items as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(), 
    );
  }
}

// BottomNavigation widget as previously defined

