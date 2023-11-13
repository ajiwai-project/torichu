import 'package:collection/collection.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'costs.freezed.dart';

@freezed
class Costs with _$Costs {
  const factory Costs({required List<Cost> values}) = _Costs;
}

extension CostsExtention on Costs {
  int get sumOfAmount =>
      values.map((e) => e.amount.value).fold(0, (a, b) => a + b);
  int get sumOfSize => values.map((e) => e.size.value).fold(0, (a, b) => a + b);

  int get length => values.length;
  Map<DateTime, Costs> get costsGroupByDate {
    Map<DateTime, Costs> costsGroupByDate = {};

    groupBy<Cost, DateTime>(
        values,
        (value) => DateTime.utc(
            value.registeredAt.year,
            value.registeredAt.month,
            value.registeredAt.day)).entries.forEach((entry) {
      costsGroupByDate[entry.key] = Costs(values: entry.value);
    });

    return costsGroupByDate;
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

  bool get isEmpty => values.isEmpty;
}
