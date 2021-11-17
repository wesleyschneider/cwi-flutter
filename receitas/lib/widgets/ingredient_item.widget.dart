import 'package:flutter/material.dart';
import 'package:receitas/utils/color.util.dart';

class IngredientItemWidget extends StatefulWidget {
  final String name;

  const IngredientItemWidget({Key? key, required this.name}) : super(key: key);

  @override
  _IngredientItemWidgetState createState() => _IngredientItemWidgetState();
}

class _IngredientItemWidgetState extends State<IngredientItemWidget> {
  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: CheckboxListTile(
        value: _checkboxValue,
        title: Text(
          widget.name,
          style: TextStyle(color: ColorUtils.secondaryColor),
        ),
        activeColor: Colors.orange,
        checkColor: Colors.white,
        onChanged: (value) {
          setState(() {
            _checkboxValue = value ?? false;
          });
        },
      ),
    );
  }
}
