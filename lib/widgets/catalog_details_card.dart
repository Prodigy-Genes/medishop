// catalog_details_cards.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CatalogDetailsCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  const CatalogDetailsCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  _CatalogDetailsCardState createState() => _CatalogDetailsCardState();
}

class _CatalogDetailsCardState extends State<CatalogDetailsCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void addToCart() {
    // Handle add to cart logic
    print('${widget.title} added to cart');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280, // Increased height
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                  height: 120, // Increased height for image
                  width: double.infinity, // Stretch image to fit width
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 8.0, 8.0, 2.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 2.0, 8.0, 2.0),
                child: Text(
                  widget.description,
                  style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 2.0, 8.0, 8.0),
                child: Text(
                  '\$${widget.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: toggleFavorite,
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(53, 71, 255, 1),
                ),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Center(
                child: TextButton(
                  onPressed: addToCart,
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Color.fromRGBO(53, 71, 255, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
