import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';

@freezed
class Tag with _$Tag {
  @Assert('value.isNotEmpty')
  @Assert('value.length <= 30')
  factory Tag._({required String value}) = _Tag;

  factory Tag.of(String value) {
    return Tag._(value: value);
  }
}
