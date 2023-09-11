import 'package:test/test.dart';

import 'ariphmetics.dart';

void main() {
  final calculator = Arithmetics();
  test('add', () {
    expect(calculator.add(2, 3), 5);
  });

  test('subtract ', () {
    expect(calculator.subtract(5, 3), 2);
  });

  test('multiply ', () {
    expect(calculator.multiply(4, 3), 12);
  });

  test('divide ', () {
    expect(calculator.divide(6, 2), 3.0);
  });

  test('divide by zero', () {
    expect(() => calculator.divide(6, 0), throwsArgumentError);
  });

  test('negative numbers', () {
    expect(() => calculator.add(-2, 3), throwsArgumentError);
    expect(() => calculator.subtract(5, -3), throwsArgumentError);
  });
}
