import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onTap;
  final String title;

  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () => onTap(),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
