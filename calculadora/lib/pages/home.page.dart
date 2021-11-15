import 'package:calculadora/widgets/display.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0XFF000000),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Display(value: '0'),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Color(0XFF000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
