import 'package:calculadora/utils/keyboard.util.dart';
import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  final String value;
  final Function(String newValue) onPress;

  const KeyboardButton({
    Key? key,
    required this.value,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width * .23;
    final width = value == '0' ? height * 2 : height;

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () => onPress(value),
      child: Container(
        decoration: BoxDecoration(
          color: KeyboardUtils.getBackgroundColorButton(value),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.all(25),
        height: height,
        width: width,
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 30,
              color: KeyboardUtils.getTextColorButton(value),
            ),
          ),
        ),
      ),
    );
  }
}
