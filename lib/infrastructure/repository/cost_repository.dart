import 'package:flutter_template/features/models/cost.dart';

abstract class CostRepository {
  Future<void> save(Cost cost);
}
