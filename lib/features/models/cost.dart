import 'package:flutter_template/features/models/category.dart';
import 'package:flutter_template/features/models/point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cost.freezed.dart';

@freezed
class Cost with _$Cost {
  static const _maxTitleLength = 100;
  static const _maxAmount = 9999999;

  const factory Cost(
      {required String title,
      required int amount,
      required Point point,
      required Category category}) = _Cost;

  factory Cost.of(
      {required String title,
      required int amount,
      required Point point,
      required Category category}) {
    if (title.length > _maxTitleLength) {
      throw Exception('Title must be 100 characters or less.');
    }

    if (amount > _maxAmount) {
      throw Exception('Amount must be less than 9999999');
    }

    return Cost(title: title, amount: amount, point: point, category: category);
  }
}
