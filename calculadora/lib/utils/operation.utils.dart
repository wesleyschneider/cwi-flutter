class OperationUtil {
  static RegExp multiRegExp = RegExp(r'\dx\d');
  static RegExp divRegExp = RegExp(r'\d\/\d');
  static RegExp sumRegExp = RegExp(r'\d\+\d');
  static RegExp subRegExp = RegExp(r'\d\-\d');

  static RegExp getRegExpOperation(String operator) {
    switch (operator) {
      case 'x':
        return multiRegExp;
      case '/':
        return divRegExp;
      case '+':
        return sumRegExp;
      case '-':
        return subRegExp;
      default:
        return multiRegExp;
    }
  }

  static double calculeOperation(String operator, double prev, double next) {
    switch (operator) {
      case 'x':
        return prev * next;
      case '/':
        return prev / next;
      case '+':
        return prev + next;
      case '-':
        return prev - next;
      default:
        return prev * next;
    }
  }

  static String calcule(String accumulator, String operator) {
    String response = accumulator;
    RegExp regExp = getRegExpOperation(operator);

    while (regExp.stringMatch(response) != null) {
      String exp = regExp.stringMatch(response) ?? '';

      double prev = double.parse(exp.substring(0, exp.indexOf(operator)));
      double next =
          double.parse(exp.substring(exp.indexOf(operator) + 1, exp.length));

      response = response.replaceFirst(
          regExp, calculeOperation(operator, prev, next).toString());
    }

    return response;
  }
}
