import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onPressed;
  final bool showWhenCodeEntered;

  const ContinueButton({
    super.key,
    required this.isEnabled,
    required this.showWhenCodeEntered,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: isEnabled
              ? const Color.fromRGBO(73, 51, 255, 1)
              : showWhenCodeEntered
                  ? const Color.fromRGBO(73, 51, 255, 1).withOpacity(0.2)
                  : const Color.fromRGBO(73, 51, 255, 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          'Continue',
          style: TextStyle(
            color: isEnabled
                ? Colors.white
                : showWhenCodeEntered
                    ? Colors.white
                    : const Color.fromARGB(255, 140, 194, 239),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
