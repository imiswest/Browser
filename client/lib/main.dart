

import 'package:flutter/material.dart';
import 'package:flutter_browser/screens/first_screen.dart';
import 'package:flutter_browser/screens/data_screen.dart';
import 'package:flutter_browser/screens/loding_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor:  Color.fromARGB(255, 253, 194, 204)),
        useMaterial3: true,
      ),
      home: FirstScreen()
    );
  }
}