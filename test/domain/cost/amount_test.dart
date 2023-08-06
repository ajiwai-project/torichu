import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validation', () {
    test('should create a valid amount', () {
      final amount = Amount.of(100);
      expect(amount.value, 100);
    });
    test('should throw an exception when amount is negative', () {
      expect(() => Amount.of(-1), throwsA(isA<AssertionError>()));
    });
    test('should throw an exception when amount is over 9,999,999', () {
      expect(() => Amount.of(10000000), throwsA(isA<AssertionError>()));
    });
  });
}
