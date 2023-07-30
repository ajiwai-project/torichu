import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cost.freezed.dart';

@freezed
class Cost with _$Cost {
  static const _maxTitleLength = 100;
  static const _maxAmount = 9999999;

  const factory Cost(
      {required String id,
      required String title,
      required int amount,
      required Point point,
      required Category category,
      required DateTime registeredAt}) = _Cost;

  factory Cost.of(
      {required String id,
      required String title,
      required int amount,
      required Point point,
      required Category category,
      required DateTime registeredAt}) {
    _validate(title, amount);
    return Cost(
        id: id,
        title: title,
        amount: amount,
        point: point,
        category: category,
        registeredAt: registeredAt);
  }

  //FIXME titleとamountは値オブジェクトにする
  static void _validate(String title, int amount) {
    if (title.length > _maxTitleLength) {
      throw Exception('Title must be 100 characters or less.');
    }

    if (amount > _maxAmount) {
      throw Exception('Amount must be less than 9999999.');
    }
  }
}
