// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PopularItemCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  const PopularItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  _PopularItemCardState createState() => _PopularItemCardState();
}

class _PopularItemCardState extends State<PopularItemCard> {
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
      height: 192,
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
                  height: 80,
                  width: 140,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '\$${widget.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(71, 53, 255, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        // Center the IconButton
                        child: IconButton(
                          onPressed: addToCart,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.zero, 
                          constraints:
                              const BoxConstraints(), 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 140,
            left: 148,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: toggleFavorite,
            ),
          ),
        ],
      ),
    );
  }
}
