import 'package:flutter_template/domain/cost/tag.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Initial', () {
    test('should have specified value', () {
      final tag = Tag.initial('tag');
      expect(tag.value, 'tag');
    });

    test('should throw when tag value is emtpy', () {
      expect(() => Tag.initial(''), throwsA(isA<AssertionError>()));
    });

    test('should throw an exception when tag value is too long', () {
      expect(() => Tag.initial('a' * 31), throwsA(isA<AssertionError>()));
    });

    test('should generate different tag when value is same', () {
      var tag1 = Tag.initial('tag');
      var tag2 = Tag.initial('tag');

      expect(tag1, isNot(tag2));
    });
  });
}
