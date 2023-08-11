import 'package:flutter_template/domain/cost/tag.dart';
import 'package:flutter_template/domain/cost/tags.dart' as my;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory', () {
    test('should have specified values', () {
      final tag = Tag.of('tag');
      final tags = my.Tags.of([tag]);
      expect(tags.value, [tag]);
    });

    test('should throw an exception when the number of tags is more than three',
        () {
      final tag = Tag.of('tag');
      expect(() => my.Tags.of([tag, tag, tag, tag]),
          throwsA(isA<AssertionError>()));
    });
  });

  group('Add', () {
    test('should add specified tag', () {
      final tag1 = Tag.of('tag1');
      final tag2 = Tag.of('tag2');
      final tags = my.Tags.of([tag1]);

      final newTags = tags.add(tag2);

      expect(newTags, my.Tags.of([tag1, tag2]));
    });
  });
}
