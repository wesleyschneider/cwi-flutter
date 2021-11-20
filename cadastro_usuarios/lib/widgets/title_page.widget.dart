import 'package:flutter/material.dart';

class TitlePageWidget extends StatelessWidget {
  final String label;

  const TitlePageWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
