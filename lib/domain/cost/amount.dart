import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount.freezed.dart';

@freezed
class Amount with _$Amount {
  @Assert('value >= 0')
  @Assert('value <= 9999999')
  factory Amount._({
    required int value,
  }) = _Amount;

  factory Amount.of(int value) {
    return Amount._(value: value);
  }
}
