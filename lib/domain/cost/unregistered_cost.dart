import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unregistered_cost.freezed.dart';

@freezed
class UnregisteredCost with _$UnregisteredCost {
  static const _maxTitleLength = 100;
  static const _maxAmount = 9999999;

  const factory UnregisteredCost({
    required String title,
    required int amount,
    required Point point,
    required Category category,
  }) = _UnregisteredCost;

  factory UnregisteredCost.of(
      {required String title,
      required int amount,
      required Point point,
      required Category category}) {
    _validate(title, amount);
    return UnregisteredCost(
        title: title, amount: amount, point: point, category: category);
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
