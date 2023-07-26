import 'package:flutter_template/domain/cost/category.dart';
import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/point.dart';
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
        title: cost.title,
        amount: cost.amount,
        point: cost.point.value,
        category: cost.category.value);
    await box.put(entity.id, entity);
  }

  @override
  Future<Costs> getAll() {
    var costs = box.values
        .map((e) => Cost(
            id: e.id,
            title: e.title,
            amount: e.amount,
            point: Point.of(e.point),
            category: Category.of(e.category)))
        .toList();

    return Future.value(Costs(values: costs));
  }

  @override
  Future<void> remove(String id) async {
    await box.delete(id);
  }
}
