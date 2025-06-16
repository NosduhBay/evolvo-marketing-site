import 'package:flutter/material.dart';
import 'package:group7evolvo/pages/home_page.dart';

void main() {
  runApp(const EvolvoApp());
}

class EvolvoApp extends StatelessWidget {
  const EvolvoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evolvō',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      home: const HomePage(),
    );
  }
}