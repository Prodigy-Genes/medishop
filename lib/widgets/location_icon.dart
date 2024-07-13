import 'package:flutter/material.dart';

class LocationDisplay extends StatelessWidget {
  final VoidCallback onLocationPressed;

  const LocationDisplay({super.key, required this.onLocationPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLocationPressed,
      child: Row(
        children: [
          Image.asset(
            'assets/icons/location.png',
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 4), 
          const Text(
            "Olesia Honchara St, 7, Lutsk",
            style: TextStyle(color: Color.fromRGBO(73, 51, 255, 1), fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
