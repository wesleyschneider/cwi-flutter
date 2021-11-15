import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String value;

  const Display({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 52),
          ),
        ],
      ),
    );
  }
}
