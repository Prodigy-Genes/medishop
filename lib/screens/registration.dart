// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:medishop/screens/home.dart';
import 'package:medishop/widgets/bottom_navigation.dart';
import 'package:medishop/widgets/continue_button.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;

  void _validateForm() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            onChanged: _validateForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "New here? Mind telling us a bit about yourself?\nWe'd love to know more about you",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Enter First Name',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                _buildTextField(
                  initialValue: 'Edward', // Pre-filled value
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Enter Last Name',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                _buildTextField(
                  initialValue: 'Cullen',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Enter your Email to receive receipts and notifications',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                _buildTextField(
                  initialValue: 'edward.eternity@gmail.com',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ContinueButton(
                  isEnabled: _isFormValid,
                  showWhenCodeEntered: false,
                  onPressed: _isFormValid
                      ? () {
                          // Handle form submission
                          if (_formKey.currentState!.validate()) {
                            // Perform the sign-up action
                            print('Form is valid');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNavigation(),
                              ),
                            );
                          }

                        }
                      : null,
                ),
                TextButton(
                  onPressed: () {
                    // Handle skip action
                  },
                  child: const Text('Skip for now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    String? initialValue,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      initialValue: initialValue,
      validator: validator,
    );
  }
}
