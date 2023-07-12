import 'package:flutter_template/infrastructure/model/cost_dao_model.dart';
import 'package:flutter_template/infrastructure/repository/cost_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CostDBRepository implements CostRepository {
  Box<CostDaoModel> box;

  CostDBRepository(this.box);

  @override
  Future<void> save(CostDaoModel cost) async {
    await box.put(cost.id, cost);
  }
}
