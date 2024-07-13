import 'package:flutter/material.dart';
import 'package:medishop/widgets/bottom_navigation.dart';
import 'package:medishop/widgets/itemslist.dart';
import 'package:medishop/widgets/search_bar.dart';

class ProductCatalogue extends StatefulWidget {
  const ProductCatalogue({super.key});

  @override
  State<ProductCatalogue> createState() => _ProductCatalogueState();
}

class _ProductCatalogueState extends State<ProductCatalogue> {
  final TextEditingController _searchController = TextEditingController();

  final List<Item> items = [
    Item(
      imagePath: 'assets/images/drug1.png',
      title: 'Item 1',
    ),
    Item(
      imagePath: 'assets/images/drug2.png',
      title: 'Item 2',
    ),
    
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Product catalog",
                style: TextStyle(
                    fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Search_Bar(
                controller: _searchController,
                onChanged: (query) {
                  print('Search query: $query');
                },
              ),
              const SizedBox(height: 0),
              Container(
                margin: const EdgeInsets.only(top: 0),
                padding: const EdgeInsets.only(top: 0), // Adjust top padding as needed
                height: 600,
                child: ItemListWidget(items: items),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
