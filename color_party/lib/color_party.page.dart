import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool isTimerActive = false;

  final colors = [
    Colors.amber,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.black,
    Colors.brown,
    Colors.yellow,
  ];
  Color currentColor = Colors.amber;

  final controller = StreamController<Colors>();

  @override
  void initState() {
    super.initState();

    generateRandomColor().listen((nextValue) {
      setState(() {
        currentColor = nextValue;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    controller.close();
  }

  onStartStopPressed() async {
    setState(() {
      isTimerActive = !isTimerActive;
    });
  }

  Stream<Color> generateRandomColor() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      if (isTimerActive) {
        final nextColorIndex = Random().nextInt(colors.length);
        yield colors[nextColorIndex];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Party'),
        backgroundColor: currentColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 150,
              height: 150,
              color: currentColor,
            ),
            ElevatedButton(
              onPressed: onStartStopPressed,
              child: const Text('Start/Stop'),
              style: ElevatedButton.styleFrom(primary: currentColor),
            )
          ],
        ),
      ),
    );
  }
}
