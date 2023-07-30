import 'package:flutter_template/domain/cost/costs.dart';
import 'package:flutter_template/domain/cost/unregistered_cost.dart';

abstract class CostRepository {
  Future<Costs> getAll();

  Future<void> save(UnregisteredCost cost);

  Future<void> remove(String id);
}
