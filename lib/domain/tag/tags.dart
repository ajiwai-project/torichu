import 'package:flutter_template/domain/cost/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tags.freezed.dart';

@freezed
class Tags with _$Tags {
  @Assert('value.length <= 3')
  factory Tags._({required List<Tag> value}) = _Tags;

  factory Tags.of(List<Tag> value) {
    return Tags._(value: value);
  }

  factory Tags.empty() {
    return Tags._(value: []);
  }
}

extension TagsExtention on Tags {
  Tags add(Tag tag) {
    return Tags._(value: [...value, tag]);
  }

  Tags remove(Tag tag) {
    return Tags._(value: value.where((e) => e.id != tag.id).toList());
  }
}
