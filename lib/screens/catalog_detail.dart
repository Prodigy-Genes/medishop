import 'package:flutter/material.dart';
import 'package:medishop/screens/fikter_and_sort.dart';
import 'package:medishop/widgets/catalog_details_card.dart';
import 'package:medishop/widgets/search_bar.dart';

class CatalogDetailScreen extends StatelessWidget {
  final String title;
  final List<String> filters;
  final Map selectedFilters;

  const CatalogDetailScreen({
    super.key,
    required this.title,
    required this.filters,
    required this.selectedFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Search_Bar(
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilterAndSortScreen())),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/filter_and_sort.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Filter and Sort',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: filters
                    .map((filter) => Chip(
                          backgroundColor: Colors.white,
                          label: Text(filter),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16),
              // Example catalog details cards arranged in a scrollable row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => print("catalog details"),
                      child: const SizedBox(
                        width: 200,
                        child: CatalogDetailsCard(
                          imagePath: "assets/images/drug2.png",
                          title: "itemName",
                          description: "itemDescription\nIn 13 Pharmacies",
                          price: 7.00,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () => print("catalog details"),
                      child: const SizedBox(
                        width: 200,
                        child: CatalogDetailsCard(
                          imagePath: "assets/images/drug2.png",
                          title: "itemName",
                          description: "itemDescription\nIn 6 Pharmacies",
                          price: 7.00,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
