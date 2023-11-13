import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../database.dart';
import './cost_dao_model.dart';

final costRepositoryProvider =
    Provider<CostRepository>((ref) => CostDBRepository());

class CostDBRepository implements CostRepository {
  CostDBRepository();

  @override
  Future<void> save(Cost cost) async {
    final daoModel = CostDaoModel.fromEntity(cost);
    await SqliteDao.getInstance()
        .create(tableName: CostDaoModel.tableName, json: daoModel.toMap());
  }

  @override
  Future<Costs> getAll() async {
    final costs = await SqliteDao.getInstance()
        .readAll(tableName: CostDaoModel.tableName)
        .then((rows) => rows
            .map((row) => CostDaoModel.fromMap(row))
            .map((cost) => cost.toEntity())
            .toList());
    return Future.value(Costs(values: costs));
  }

  @override
  Future<void> remove(String id) async {
    await SqliteDao.getInstance().delete(tableName: CostDaoModel.tableName, id: id);
  }
}
