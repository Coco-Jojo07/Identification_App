import 'package:flutter/material.dart';
import 'package:identification/screens/launch_screen.dart';
import 'package:identification/screens/modif_screen.dart';
import 'package:identification/screens/register_screen.dart';
import 'package:identification/screens/verification_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}