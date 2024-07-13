// search_bar.dart
// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:medishop/screens/recent_search.dart';

class Search_Bar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String hintText;

  const Search_Bar({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText = 'Search...',
  });

  @override
  _Search_BarState createState() => _Search_BarState();
}

class _Search_BarState extends State<Search_Bar> {
  bool _isActive = false;

  void _setActive(bool active) {
    setState(() {
      _isActive = active;
    });

    if (active) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecentSearchesScreen(
            onSearchSelected: (query) {
              widget.controller.text = query;
              widget.onChanged?.call(query);
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
        border: _isActive
            ? Border.all(
                color: const Color.fromRGBO(71, 53, 255, 1),
                width: 2.0,
              )
            : null,
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.search, color: Colors.grey),
          ),
          Expanded(
            child: Focus(
              onFocusChange: (hasFocus) {
                _setActive(hasFocus);
              },
              child: TextField(
                controller: widget.controller,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
