// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medishop/screens/login_signup.dart';
import 'package:medishop/screens/registration.dart';
import 'package:medishop/widgets/continue_button.dart';
import 'package:medishop/widgets/pin_code_input.dart';

class CodeVerification extends StatefulWidget {
  final String phoneNumber;

  const CodeVerification({super.key, required this.phoneNumber});

  @override
  _CodeVerificationState createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  int _secondsRemaining = 25; // Initial countdown time in seconds
  late Timer _timer;
  String _enteredCode = '';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void handleCodeVerification() {
    // Implement your logic to handle code verification here
    print('Entered code: $_enteredCode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 25),
              const Text(
                'Enter Code',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                'We\'ve sent a 4-digit code to ${widget.phoneNumber}. Please check your messages and enter the code below:',
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),
              PinCodeInput(
                onCodeChanged: (code) {
                  setState(() {
                    _enteredCode = code;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Resend code in 00:$_secondsRemaining',
                style: TextStyle(
                    color: _secondsRemaining > 0 ? Colors.black : Colors.red),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 16.0,
              ),
              ContinueButton(
                isEnabled: _enteredCode.length == 4,
                showWhenCodeEntered: true, 
                onPressed: () {
                  // Handle button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Registration()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
