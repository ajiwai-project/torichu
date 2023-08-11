import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'tag.freezed.dart';

@freezed
class Tag with _$Tag {
  @Assert('value.isNotEmpty')
  @Assert('value.length <= 30')
  factory Tag._({required String id, required String value}) = _Tag;

  factory Tag.initial(String value) {
    return Tag._(id: const Uuid().v4(), value: value);
  }
}
