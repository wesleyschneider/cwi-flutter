import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPicture extends StatelessWidget {
  final String path;

  const DisplayPicture({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(path)),
    );
  }
}
