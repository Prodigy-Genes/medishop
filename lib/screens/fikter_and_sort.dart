// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:medishop/screens/catalog_detail.dart';
import 'package:medishop/widgets/catalog_details_card.dart';
import 'package:medishop/widgets/search_bar.dart';

class FilterAndSortScreen extends StatefulWidget {
  const FilterAndSortScreen({super.key});

  @override
  _FilterAndSortScreenState createState() => _FilterAndSortScreenState();
}

class _FilterAndSortScreenState extends State<FilterAndSortScreen> {
  bool hideOutOfStock = false;
  String? sortBy;
  List<String> filterBy = [];
  List<String> dosageForms = [];
  List<String> quantityPerPackage = [];

  void toggleHideOutOfStock() {
    setState(() {
      hideOutOfStock = !hideOutOfStock;
    });
  }

  void updateSortBy(String? value) {
    setState(() {
      sortBy = value;
    });
  }

  void toggleFilterOption(String option) {
    setState(() {
      if (filterBy.contains(option)) {
        filterBy.remove(option);
      } else {
        filterBy.add(option);
      }
    });
  }

  void toggleDosageFormOption(String option) {
    setState(() {
      if (dosageForms.contains(option)) {
        dosageForms.remove(option);
      } else {
        dosageForms.add(option);
      }
    });
  }

  void toggleQuantityOption(String option) {
    setState(() {
      if (quantityPerPackage.contains(option)) {
        quantityPerPackage.remove(option);
      } else {
        quantityPerPackage.add(option);
      }
    });
  }

  

  void applyFilters() {
    List<String> selectedFilters = [];
    if (sortBy != null) {
      selectedFilters.add(sortBy!);
    }
    selectedFilters.addAll(filterBy);
    selectedFilters.addAll(dosageForms);
    selectedFilters.addAll(quantityPerPackage);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CatalogDetailScreen(
              title: 'Catalog Details',
              filters: selectedFilters, selectedFilters: const {},
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Center(
          child: Text(
            'Filter & Sort',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Hide out of stock'),
                Switch(
                  value: hideOutOfStock,
                  activeTrackColor: const Color.fromRGBO(53, 71, 255, 1),
                  inactiveThumbColor: Colors.white,
                  onChanged: (value) {
                    toggleHideOutOfStock();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ExpansionTile(
              title: const Text('Sort by', style: TextStyle(fontWeight: FontWeight.bold)),
              children: ['Tablet', 'Capsule', 'Liquid']
                  .map((option) => CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: const Color.fromRGBO(53, 71, 255, 1),
                        title: Text(option),
                        value: dosageForms.contains(option),
                        onChanged: (_) {
                          toggleDosageFormOption(option);
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            const Text('Filter by', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: filterBy
                  .map((filter) => Chip(
                        label: Text(filter),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            ExpansionTile(
              title: const Text('Dosage Form'),
              children: ['Tablet', 'Capsule', 'Liquid']
                  .map((option) => CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: const Color.fromRGBO(53, 71, 255, 1),
                        title: Text(option),
                        value: dosageForms.contains(option),
                        onChanged: (_) {
                          toggleDosageFormOption(option);
                        },
                      ))
                  .toList(),
            ),
            ExpansionTile(
              title: const Text('Quantity per package'),
              children: ['10 pieces', '20 pieces', '50 pieces', '100 pieces']
                  .map((option) => CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: const Color.fromRGBO(53, 71, 255, 1),
                        title: Text(option),
                        value: quantityPerPackage.contains(option),
                        onChanged: (_) {
                          toggleQuantityOption(option);
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: applyFilters,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(53, 71, 255, 1),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Apply All', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}


