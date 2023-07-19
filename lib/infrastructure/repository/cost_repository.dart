import 'package:flutter_template/features/models/cost.dart';

abstract class CostRepository {
  Future<List<Cost>> getAll();

  Future<void> save(Cost cost);
}
