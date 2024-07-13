// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:medishop/screens/home.dart';
import 'package:medishop/screens/login_signup.dart';
import 'package:medishop/screens/product_catalogue.dart';
import 'package:medishop/screens/registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginSignup(),
    );
  }
}

