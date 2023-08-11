import 'package:flutter_template/domain/tag/tag.dart';
import 'package:flutter_template/domain/tag/tags.dart' as my;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Factory', () {
    test('should have specified values', () {
      final tag = Tag.initial('tag');
      final tags = my.Tags.of([tag]);
      expect(tags.value, [tag]);
    });

    test('should throw an exception when the number of tags is more than three',
        () {
      final tag = Tag.initial('tag');
      expect(() => my.Tags.of([tag, tag, tag, tag]),
          throwsA(isA<AssertionError>()));
    });
  });

  group('Add', () {
    test('should add specified tag', () {
      final tag1 = Tag.initial('tag1');
      final tag2 = Tag.initial('tag2');
      final tags = my.Tags.of([tag1]);

      final newTags = tags.add(tag2);

      expect(newTags, my.Tags.of([tag1, tag2]));
    });
  });

  group('Remove', () {
    test('should remove tag', () {
      final tag1 = Tag.initial('tag1');
      final tag2 = Tag.initial('tag2');
      final tags = my.Tags.of([tag1, tag2]);

      final newTags = tags.remove(tag1);

      expect(newTags, my.Tags.of([tag2]));
    });
  });
}
