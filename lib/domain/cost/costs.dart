import 'package:collection/collection.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'costs.freezed.dart';

@freezed
class Costs with _$Costs {
  const factory Costs({required List<Cost> values}) = _Costs;
}

extension CostsExtention on Costs {
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
