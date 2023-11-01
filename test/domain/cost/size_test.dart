import 'package:flutter_template/domain/cost/size.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('symbol', () {
    expect(Size.small.symbol, 'S');
    expect(Size.medium.symbol, 'M');
    expect(Size.large.symbol, 'L');
  });
}
