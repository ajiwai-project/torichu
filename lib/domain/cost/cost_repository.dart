import 'package:flutter_template/domain/cost/cost.dart';

abstract class CostRepository {
  Future<List<Cost>> getAll();

  Future<void> save(Cost cost);

  Future<void> remove(String id);
}
