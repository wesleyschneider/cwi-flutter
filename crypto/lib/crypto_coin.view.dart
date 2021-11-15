import 'package:flutter/material.dart';

class CryptoCoinView extends StatelessWidget {
  Color backgroundColor;
  String name;
  String abbreviation;
  String value;
  String raise;

  CryptoCoinView({
    required this.backgroundColor,
    required this.name,
    required this.abbreviation,
    required this.value,
    required this.raise,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      height: 69,
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Color(0X30FFFFFF),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                abbreviation.substring(0, 1),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 11,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      abbreviation,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: Color(0x80FFFFFF),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '\$$value',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Text(
            raise,
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
