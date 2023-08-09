import 'package:freezed_annotation/freezed_annotation.dart';

part 'title.freezed.dart';

@freezed
class Title with _$Title {
  @Assert('value.length <= 100')
  @Assert('value.isNotEmpty')
  factory Title._({required String value}) = _Title;

  factory Title.of(String value) {
    return Title._(value: value);
  }
}
