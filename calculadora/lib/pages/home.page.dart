import 'package:calculadora/utils/color.util.dart';
import 'package:calculadora/utils/keyboard.util.dart';
import 'package:calculadora/widgets/display.widget.dart';
import 'package:calculadora/widgets/keyboard.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String value = '';

  setValue(String newValue) {
    setState(() {
      if (KeyboardUtils.onlyNumbers(newValue)) {
        value += newValue;
      } else if (newValue == '.' && !value.contains('.')) {
        value += newValue;
      } else if (KeyboardUtils.onlyOperators(newValue) &&
          !KeyboardUtils.endsWithOperator(value) &&
          value.isNotEmpty) {
        value += newValue;
      } else if (newValue == 'ac') {
        value = '';
      } else if (newValue == '=') {
        if (KeyboardUtils.endsWithOperator(value)) {
          value = value.substring(0, value.length - 1);
        }

        String total = KeyboardUtils.calculateTotal(value);

        value += '=$total';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorUtils.black,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Display(value: value),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              flex: 4,
              child: Keyboard(
                setValue: setValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
