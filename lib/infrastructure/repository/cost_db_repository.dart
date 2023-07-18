import 'package:flutter_template/features/models/cost.dart';
import 'package:flutter_template/infrastructure/model/cost_dao_model.dart';
import 'package:flutter_template/infrastructure/repository/cost_repository.dart';
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
}
