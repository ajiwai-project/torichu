import 'package:flutter_template/domain/cost/size.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('upperCase', () {
    expect(Size.small.upperCase(), 'SMALL');
    expect(Size.medium.upperCase(), 'MEDIUM');
    expect(Size.large.upperCase(), 'LARGE');
  });
  test('symbol', () {
    expect(Size.small.symbol(), 'S');
    expect(Size.medium.symbol(), 'M');
    expect(Size.large.symbol(), 'L');
  });
}
