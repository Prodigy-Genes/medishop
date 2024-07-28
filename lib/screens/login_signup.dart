import 'package:flutter/material.dart';
import 'package:medishop/screens/code_verification.dart';
import 'package:medishop/widgets/apple_button.dart';
import 'package:medishop/widgets/continue_button.dart';
import 'package:medishop/widgets/google_button.dart';

class LoginSignup extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginSignup({super.key, required this.onLoginSuccess});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isPhoneNumberValid = false;
  String _countryCode = '+38'; // Default country code

  void _validatePhoneNumber(String value) {
    setState(() {
      _isPhoneNumberValid = value.length == 10;
    });
  }

  void _handleContinue() {
    if (_isPhoneNumberValid) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CodeVerification(
                    phoneNumber: '$_countryCode ${_phoneController.text}',
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 75),
              const Text(
                'Login or Sign up',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter your phone number',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          right:
                              BorderSide(color: Colors.grey.withOpacity(0.5)),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: _countryCode,
                        onChanged: (newValue) {
                          setState(() {
                            _countryCode = newValue!;
                          });
                        },
                        items: <String>['+38', '+1', '+91', '+44', '+233']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: ' 00 000 0000',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(16),
                          prefixText: _countryCode,
                        ),
                        onChanged: _validatePhoneNumber,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                "We'll send a text to verify your phone. Please ensure it's a valid and active phone number.",
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16.0),
              ContinueButton(
                isEnabled: _isPhoneNumberValid,
                showWhenCodeEntered: false,
                onPressed: _handleContinue,
              ),
              const SizedBox(height: 24.0),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or'),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              AppleButton(onPressed: () {
                //Handle 'Continue with Apple' button press
              }),
              const SizedBox(height: 12.0),
              GoogleButton(
                onPressed: () {
                  // Handle 'Continue with Google' button press
                },
              ),
              const SizedBox(height: 2.0),
              TextButton(
                onPressed: () {
                  // Handle 'Continue as guest' button press
                  _handleContinue();
                },
                style: TextButton.styleFrom(
                  fixedSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  'Continue as guest',
                  style: TextStyle(color: Color.fromRGBO(32, 10, 228, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
