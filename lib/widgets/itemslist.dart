import 'package:flutter/material.dart';

class ItemListWidget extends StatelessWidget {
  final List<Item> items;
  final Function(Item) onItemTap;

  const ItemListWidget({super.key, required this.items, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: GestureDetector(
            onTap: () => onItemTap(item),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 230, 230).withOpacity(0.2),
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Image.asset(
                    item.imagePath,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 18,
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
      },
    );
  }
}

class Item {
  final String imagePath;
  final String title;

  Item({
    required this.imagePath,
    required this.title,
  });
}
