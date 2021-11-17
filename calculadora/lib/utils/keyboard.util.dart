import 'package:calculadora/utils/color.util.dart';
import 'package:calculadora/utils/operation.utils.dart';
import 'package:flutter/material.dart';

class KeyboardUtils {
  static const operators = ['x', '/', '+', '-'];
  static const keysMap = [
    'ac',
    '+/-',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '='
  ];

  static const orangeKeys = ['/', 'x', '-', '+', '='];
  static const greyKeys = ['ac', '+/-', '%'];

  static Color getBackgroundColorButton(String value) {
    if (orangeKeys.contains(value)) {
      return ColorUtils.orange;
    }

    if (greyKeys.contains(value)) {
      return ColorUtils.grey;
    }

    return ColorUtils.greyDark;
  }

  static Color getTextColorButton(String value) {
    if (greyKeys.contains(value)) {
      return ColorUtils.black;
    }

    return ColorUtils.white;
  }

  static bool onlyNumbers(String value) {
    RegExp regExp = RegExp(r"([,0-9])*\d");

    return regExp.hasMatch(value);
  }

  static bool onlyOperators(String value) {
    return operators.contains(value);
  }

  static bool endsWithOperator(String value) {
    return operators.any((element) => value.endsWith(element));
  }

  static String calculateTotal(String expression) {
    String response = expression;

    for (var operator in operators) {
      response = OperationUtil.calcule(response, operator);
    }

    return response;
  }
}
