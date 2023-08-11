import 'package:flutter_template/domain/cost/tag.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory', () {
    test('should have specified value', () {
      final tag = Tag.of('tag');
      expect(tag.value, 'tag');
    });

    test('should throw when tag value is emtpy', () {
      expect(() => Tag.of(''), throwsA(isA<AssertionError>()));
    });

    test('should throw an exception when tag value is too long', () {
      expect(() => Tag.of('a' * 31), throwsA(isA<AssertionError>()));
    });

    test('should generate different tag when value is same', () {
      var tag1 = Tag.of('tag');
      var tag2 = Tag.of('tag');

      expect(tag1, isNot(tag2));
    });
  });
}
