import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/title.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'cost.freezed.dart';

@freezed
class Cost with _$Cost {
  factory Cost._(
      {required String id,
      required Title title,
      required Amount amount,
      required Point point,
      required Category category,
      required DateTime registeredAt}) = _Cost;

  factory Cost.of(
      {required String id,
      required Title title,
      required Amount amount,
      required Point point,
      required Category category,
      required DateTime registeredAt}) {
    return Cost._(
        id: id,
        title: title,
        amount: amount,
        point: point,
        category: category,
        registeredAt: registeredAt);
  }

  factory Cost.initial(
      {required Title title,
      required Amount amount,
      required Point point,
      required Category category}) {
    return Cost._(
        id: const Uuid().v4(),
        title: title,
        amount: amount,
        point: point,
        category: category,
        registeredAt: DateTime.now());
  }
}
