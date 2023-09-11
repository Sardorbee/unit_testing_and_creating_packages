class Arithmetics {


  int add(int a, int b) {
    checkPositive(a, "a");
    checkPositive(b, "b");
    return a + b;
  }

  int subtract(int a, int b) {
    checkPositive(a, "a");
    checkPositive(b, "b");
    return a - b;
  }

  int multiply(int a, int b) {
    checkPositive(a, "a");
    checkPositive(b, "b");
    return a * b;
  }

  double divide(int a, int b) {
    checkPositive(a, "a");
    checkPositive(b, "b");
    if (b == 0) {
      throw ArgumentError("b nolga bo'linmaydi");
    }
    return a / b;
  }

  void checkPositive(int number, String numberName) {
    if (number < 0) {
      throw ArgumentError("$numberName musbat son bo'lishi kerak");
    }
  }
}
