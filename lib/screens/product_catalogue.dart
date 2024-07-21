import 'package:flutter/material.dart';
import 'package:medishop/screens/catalog_detail.dart';
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

  void _handleItemTap(Item item) {
    // Handle item tap
    print('Item tapped: ${item.title}');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CatalogDetailScreen(title: item.title, selectedFilters: const {}, filters: const [],),
      ),
    );
  }

  final List<Item> items = [
    Item(
      imagePath: 'assets/images/drug1.png',
      title: 'Item 1',
    ),
    Item(
      imagePath: 'assets/images/drug2.png',
      title: 'Pain Relievers',
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
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
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
                padding: const EdgeInsets.only(top: 0),
                height: 600,
                child: ItemListWidget(
                  items: items,
                  onItemTap: _handleItemTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
