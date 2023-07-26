import 'package:flutter_template/domain/cost/cost.dart';
import 'package:flutter_template/domain/cost/costs.dart';

abstract class CostRepository {
  Future<Costs> getAll();

  Future<void> save(Cost cost);

  Future<void> remove(String id);
}
