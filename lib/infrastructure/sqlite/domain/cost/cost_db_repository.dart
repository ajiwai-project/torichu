import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/cost_repository.dart';
import 'package:flutter_template/domain/cost/costs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './cost_dao_model.dart';

final costRepositoryProvider =
    Provider<CostRepository>((ref) => CostDBRepository());

class CostDBRepository implements CostRepository {
  final CostDao _dao = CostDao();
  CostDBRepository();

  @override
  Future<void> save(Cost cost) async {
    final daoModel = CostDaoModel.fromEntity(cost);
    await _dao.create(daoModel);
  }

  @override
  Future<Costs> getAll() async {
    final costs = await _dao
        .readAll()
        .then((value) => value.map((e) => e.toEntity()).toList());
    return Future.value(Costs(values: costs));
  }

  @override
  Future<void> remove(String id) async {
    await _dao.delete(id);
  }
}
