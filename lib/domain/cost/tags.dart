import 'package:flutter_template/domain/cost/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tags.freezed.dart';

@freezed
class Tags with _$Tags {
  @Assert('value.length <= 3')
  factory Tags._({required List<Tag> value}) = _Tags;

  factory Tags.of(List<Tag> value) {
    if (value.length != value.toSet().length) {
      throw AssertionError();
    }

    return Tags._(value: value);
  }

  factory Tags.empty() {
    return Tags._(value: []);
  }
}

extension TagsExtention on Tags {
  Tags add(Tag tag) {
    if (value.contains(tag)) {
      throw Exception('Same value contains');
    }
    return Tags._(value: [...value, tag]);
  }

  Tags remove(Tag tag) {
    return Tags._(value: value.where((e) => e.value != tag.value).toList());
  }
}
