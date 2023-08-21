import 'package:freezed_annotation/freezed_annotation.dart';

part 'saying.freezed.dart';

@freezed
class Saying with _$Saying {
  const factory Saying({required String value, required String author}) =
      _Saying;
}
