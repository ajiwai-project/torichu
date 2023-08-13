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
      final tag1 = Tag.of('tag1');
      final tag2 = Tag.of('tag2');
      final tag3 = Tag.of('tag3');
      final tag4 = Tag.of('tag4');
      expect(() => my.Tags.of([tag1, tag2, tag3, tag4]),
          throwsA(isA<AssertionError>()));
    });

    test('should throw an exception when same values are specified', () {
      final tag = Tag.of('tag');
      expect(() => my.Tags.of([tag, tag]), throwsA(isA<AssertionError>()));
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

    test('should throw an exception when same value is added', () {
      final tag = Tag.of('tag');
      final tags = my.Tags.of([tag]);

      expect(() => tags.add(tag), throwsA(isA<Exception>()));
    });
  });

  group('Remove', () {
    test('should remove tag', () {
      final tag1 = Tag.of('tag1');
      final tag2 = Tag.of('tag2');
      final tags = my.Tags.of([tag1, tag2]);

      final newTags = tags.remove(tag1);

      expect(newTags, my.Tags.of([tag2]));
    });
  });
}
