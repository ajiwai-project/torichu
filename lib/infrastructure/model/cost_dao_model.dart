import 'package:hive_flutter/hive_flutter.dart';

part 'cost_dao_model.g.dart';

@HiveType(typeId: 0)
class CostDaoModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  int amount;

  @HiveField(2)
  int point;

  @HiveField(3)
  String date;

  @HiveField(4)
  String category;

  CostDaoModel(
      {required this.id,
      required this.amount,
      required this.point,
      required this.date,
      required this.category});

  @override
  bool operator ==(other) =>
      other is CostDaoModel &&
      id == other.id &&
      amount == other.amount &&
      point == other.point &&
      date == other.date &&
      category == other.category;

  @override
  int get hashCode => Object.hash(id, amount, point, date, category);

  @override
  String toString() {
    return 'TaskEntity('
        'id: $id, '
        'amount: $amount, '
        'point: $point, '
        'date: $date, '
        'category: $category'
        ')';
  }
}
