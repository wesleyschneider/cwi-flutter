import 'package:flutter/material.dart';
import 'package:random_dog_app/pages/random_dog.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Dog app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RandomDogPage(),
    );
  }
}
