// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:medishop/widgets/search_bar.dart';

class RecentSearchesScreen extends StatefulWidget {
  final Function(String) onSearchSelected;

  const RecentSearchesScreen({super.key, required this.onSearchSelected});

  @override
  _RecentSearchesScreenState createState() => _RecentSearchesScreenState();
}

class _RecentSearchesScreenState extends State<RecentSearchesScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = ["example1", "example2", "example3"];

  void _removeSearch(String search) {
    setState(() {
      recentSearches.remove(search);
    });
  }

  void _clearAllSearches() {
    setState(() {
      recentSearches.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search_Bar(
              controller: _searchController,
              onChanged: (query) {
                print('Search query: $query');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Searches',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: _clearAllSearches,
                  child: const Text(
                    'Clear All',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: recentSearches.length,
                itemBuilder: (context, index) {
                  final search = recentSearches[index];
                  return ListTile(
                    title: Text(search),
                    trailing: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.red),
                      onPressed: () => _removeSearch(search),
                    ),
                    onTap: () {
                      widget.onSearchSelected(search);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
