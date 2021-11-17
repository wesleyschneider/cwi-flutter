import 'package:calculadora/utils/keyboard.util.dart';
import 'package:calculadora/widgets/keyboard_button.widget.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final Function(String value) setValue;

  const Keyboard({
    Key? key,
    required this.setValue,
  }) : super(key: key);

  List<List<Widget>> _buildRows() {
    List<List<Widget>> result = [[]];

    int currentRow = 0;

    for (var e in KeyboardUtils.keysMap) {
      if (result[currentRow].length == 4) {
        result.add([]);
        currentRow += 1;
      }

      result[currentRow].add(
        KeyboardButton(
          value: e,
          onPress: setValue,
        ),
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ..._buildRows().map(
          (row) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...row.map(
                (button) => button,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
