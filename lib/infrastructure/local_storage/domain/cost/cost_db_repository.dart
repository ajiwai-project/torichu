import 'package:flutter_template/domain/cost/amount.dart';
import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/point.dart';
import 'package:flutter_template/domain/cost/tags.dart';
import 'package:flutter_template/domain/cost/title.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_dao_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final costRepositoryProvider =
    Provider<CostRepository>((ref) => CostDBRepository(Hive.box('costBox')));

class CostDBRepository implements CostRepository {
  Box<CostDaoModel> box;

  CostDBRepository(this.box);

  @override
  Future<void> save(Cost cost) async {
    var entity = CostDaoModel.of(
        id: cost.id,
        title: cost.title.value,
        amount: cost.amount.value,
        point: cost.point.value,
        category: cost.category.value,
        registeredAt: cost.registeredAt.toIso8601String(),
        tagIds: cost.tags.value.map((e) => e.id).toList());
    await box.put(entity.id, entity);
  }

  @override
  Future<Costs> getAll() {
    var values = box.values;
    var costs = values
        .map((e) => Cost.of(
            id: e.id,
            title: Title.of(e.title),
            amount: Amount.of(e.amount),
            point: Point.of(e.point),
            category: Category.of(e.category),
            registeredAt: DateTime.parse(e.registeredAt),
            tags: Tags.of([])))
        .toList();

    return Future.value(Costs(values: costs));
  }

  @override
  Future<void> remove(String id) async {
    await box.delete(id);
  }
}
