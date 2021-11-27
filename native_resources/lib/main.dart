import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_resources/camera.page.dart';
import 'package:native_resources/location.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        LocationPage.route: (_) => const LocationPage(),
        CameraPage.route: (_) => const CameraPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoButton(
            child: const Text('Camera'),
            onPressed: () {
              Navigator.pushNamed(context, CameraPage.route);
            },
          ),
          CupertinoButton(
            child: const Text('Localização'),
            onPressed: () {
              Navigator.pushNamed(context, LocationPage.route);
            },
          )
        ],
      ),
    );
  }
}
