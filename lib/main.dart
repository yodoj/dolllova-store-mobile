import 'package:flutter/material.dart';
import 'package:dollova_store/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dollova Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
       primarySwatch: Colors.pink,
      ).copyWith(secondary: Colors.pink[300]),
        scaffoldBackgroundColor: Colors.pink[50], 
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}