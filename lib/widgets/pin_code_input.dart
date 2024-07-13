// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PinCodeInput extends StatefulWidget {
  final ValueChanged<String>? onCodeChanged;

  const PinCodeInput({super.key, this.onCodeChanged});

  @override
  _PinCodeInputState createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (index) => TextEditingController());
    _focusNodes = List.generate(4, (index) => FocusNode());
    _focusNodes[_currentIndex].requestFocus();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _handleInputChange(String value) {
    if (value.length == 1) {
      _currentIndex = (_currentIndex + 1) % 4; // Move focus to the next TextField
      _focusNodes[_currentIndex].requestFocus();
    } else if (value.isEmpty && _currentIndex > 0) {
      _currentIndex--; // Move focus to the previous TextField if current is empty
      _focusNodes[_currentIndex].requestFocus();
    }

    String code = '';
    for (var controller in _controllers) {
      code += controller.text;
    }
    if (widget.onCodeChanged != null) {
      widget.onCodeChanged!(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16), // Adjust the horizontal margin as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4), // Adjust the horizontal padding between cells
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _controllers[index],
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                  ),
                  onChanged: _handleInputChange,
                  focusNode: _focusNodes[index],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
