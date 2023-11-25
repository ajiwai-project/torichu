import 'package:flutter_template/domain/saying/saying.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saying_state.freezed.dart';

@freezed
class SayingState with _$SayingState {
  const factory SayingState({Saying? saying}) = _SayingState;
}
