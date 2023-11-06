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

  @HiveField(5)
  String registeredAt;

  @HiveField(7)
  int size;

  CostDaoModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.size,
    required this.registeredAt,
  });

  factory CostDaoModel.of({
    required String id,
    required String title,
    required amount,
    required int size,
    required String registeredAt,
  }) {
    return CostDaoModel(
      id: id,
      title: title,
      amount: amount,
      size: size,
      registeredAt: registeredAt,
    );
  }

  @override
  bool operator ==(other) =>
      other is CostDaoModel &&
      id == other.id &&
      title == other.title &&
      amount == other.amount &&
      size == other.size &&
      registeredAt == other.registeredAt;

  @override
  int get hashCode => Object.hash(id, title, amount, size, registeredAt);

  @override
  String toString() {
    return 'CostDaoModel('
        'id: $id, '
        'title: $title, '
        'amount: $amount, '
        'size: $size, '
        'date: $registeredAt, '
        ')';
  }
}
