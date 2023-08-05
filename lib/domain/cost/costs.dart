import 'package:collection/collection.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'costs.freezed.dart';

@freezed
class Costs with _$Costs {
  const factory Costs({required List<Cost> values}) = _Costs;
}

extension CostsExtention on Costs {
  int get sumOfAmount => values.map((e) => e.amount).fold(0, (a, b) => a + b);
  int get sumOfPoint =>
      values.map((e) => e.point.value).fold(0, (a, b) => a + b);

  int get length => values.length;

  Map<Category, int> get amountGroupByCategory {
    Map<Category, int> amountMap = {};

    groupBy<Cost, Category>(values, (value) => value.category)
        .entries
        .forEach((entry) {
      amountMap[entry.key] =
          entry.value.map((e) => e.amount).fold(0, (a, b) => a + b);
    });

    return amountMap;
  }

  Map<Category, int> get pointGroupByCategory {
    Map<Category, int> pointMap = {};

    groupBy<Cost, Category>(values, (value) => value.category)
        .entries
        .forEach((entry) {
      pointMap[entry.key] =
          entry.value.map((e) => e.point.value).fold(0, (a, b) => a + b);
    });

    return pointMap;
  }

  Cost get(int index) => values[index];

  Costs sortByRegisteredAt({bool desc = true}) {
    return Costs(
        values: values
            .sorted((a, b) => desc
                ? b.registeredAt.compareTo(a.registeredAt)
                : a.registeredAt.compareTo(b.registeredAt))
            .toList());
  }
}
