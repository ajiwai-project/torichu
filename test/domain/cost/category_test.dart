import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parameterized_test/parameterized_test.dart';

void main() {
  group('of', () {
    parameterizedTest('should return specified category', [
      ['食費', Category.food],
      ['趣味・娯楽', Category.hobbies],
      ['交際費', Category.entertainment],
      ['衣服・美容', Category.clothingAndBeauty],
      ['健康・医療', Category.healthAndMedicalCare],
      ['教養・教育', Category.education],
      ['水道・光熱費', Category.utility],
      ['住宅', Category.housing],
      ['保険', Category.insurance],
      ['通信費', Category.network],
      ['交通費', Category.transportation]
    ], p2((String value, Category expected) {
      expect(Category.of(value), expected);
    }));
  });

  test('The number of category should be 11', () {
    expect(Category.values.length, 11);
  });
}
