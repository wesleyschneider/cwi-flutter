import 'package:flutter/material.dart';

class FoodModel {
  final String type;
  final int numberOfLikes;
  final int numberOfComments;
  final String name;
  final Color textColor;

  FoodModel(
      {required this.type,
      required this.numberOfLikes,
      required this.numberOfComments,
      required this.name,
      required this.textColor});
}
