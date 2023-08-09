import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validation', () {
    test('should create a valid title', () {
      final title = Title.of('title');
      expect(title.value, 'title');
    });
    test('should throw an exception if the title is empty', () {
      expect(() => Title.of(''), throwsA(isA<AssertionError>()));
    });
    test('should throw an exception if the title is too long', () {
      expect(() => Title.of('a' * 101), throwsA(isA<AssertionError>()));
    });
  });
}
