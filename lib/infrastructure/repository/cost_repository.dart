import 'package:flutter_template/infrastructure/model/cost_dao_model.dart';

abstract class CostRepository {
  Future<void> save(CostDaoModel cost);
}
