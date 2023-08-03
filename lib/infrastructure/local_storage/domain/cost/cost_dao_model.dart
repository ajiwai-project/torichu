import 'package:hive_flutter/hive_flutter.dart';

part 'cost_dao_model.g.dart';

@HiveType(typeId: 0)
class CostDaoModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int amount;

  @HiveField(3)
  int point;

  @HiveField(4)
  String category;

  @HiveField(5)
  String registeredAt;

  CostDaoModel(
      {required this.id,
      required this.title,
      required this.amount,
      required this.point,
      required this.category,
      required this.registeredAt});

  factory CostDaoModel.of(
      {required String id,
      required String title,
      required amount,
      required int point,
      required String category,
      required String registeredAt}) {
    return CostDaoModel(
      id: id,
      title: title,
      amount: amount,
      point: point,
      category: category,
      registeredAt: registeredAt,
    );
  }

  @override
  bool operator ==(other) =>
      other is CostDaoModel &&
      id == other.id &&
      title == other.title &&
      amount == other.amount &&
      point == other.point &&
      registeredAt == other.registeredAt &&
      category == other.category;

  @override
  int get hashCode =>
      Object.hash(id, title, amount, point, registeredAt, category);

  @override
  String toString() {
    return 'TaskEntity('
        'id: $id, '
        'title: $title, '
        'amount: $amount, '
        'point: $point, '
        'date: $registeredAt, '
        'category: $category'
        ')';
  }
}
