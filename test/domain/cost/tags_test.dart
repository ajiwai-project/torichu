import 'package:flutter_template/domain/cost/tag.dart';
import 'package:flutter_template/domain/cost/tags.dart' as sut;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory', () {
    test('should have specified values', () {
      final tag = Tag.of('tag');
      final tags = sut.Tags.of([tag]);
      expect(tags.value, [tag]);
    });

    test('should throw an exception when the number of tags is more than three',
        () {
      final tag = Tag.of('tag');
      expect(() => sut.Tags.of([tag, tag, tag, tag]),
          throwsA(isA<AssertionError>()));
    });
  });
}
