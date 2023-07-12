import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

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
  String date;

  @HiveField(5)
  String category;

  CostDaoModel._(
      {required this.id,
      required this.title,
      required this.amount,
      required this.point,
      required this.date,
      required this.category});

  factory CostDaoModel.of(
      {required String title,
      required amount,
      required int point,
      required String category}) {
    return CostDaoModel._(
        id: const Uuid().v4(),
        title: title,
        amount: amount,
        point: point,
        date: DateTime.now().toString(),
        category: category);
  }

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
