import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int counter = 0;
  bool isTimerActive = false;
  final controller = StreamController<int>();
  Sink<int> get sink => controller.sink;
  Stream<int> get stream => controller.stream;

  @override
  void initState() {
    super.initState();

    stream.listen((nextValue) {
      setState(() {
        counter = nextValue;
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

    while (isTimerActive) {
      await Future.delayed(const Duration(seconds: 1));
      sink.add(counter + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: const TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              onPressed: onStartStopPressed,
              child: const Text('Start/Stop'),
            )
          ],
        ),
      ),
    );
  }
}
