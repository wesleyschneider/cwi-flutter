import 'package:flutter/material.dart';

class GridColors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.purple[100],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.purple[200],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.purple[300],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red[100],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red[200],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.green[100],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green[200],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green[300],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
