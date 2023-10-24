import 'package:flutter_template/infrastructure/local_storage/domain/cost/tag_dao_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  @HiveField(5)
  String registeredAt;

  @HiveField(6)
  List<TagDaoModel> tags;

  CostDaoModel(
      {required this.id,
      required this.title,
      required this.amount,
      required this.point,
      required this.registeredAt,
      required this.tags});

  factory CostDaoModel.of(
      {required String id,
      required String title,
      required amount,
      required int point,
      required String registeredAt,
      required List<TagDaoModel> tags}) {
    return CostDaoModel(
        id: id,
        title: title,
        amount: amount,
        point: point,
        registeredAt: registeredAt,
        tags: tags);
  }

  @override
  bool operator ==(other) =>
      other is CostDaoModel &&
      id == other.id &&
      title == other.title &&
      amount == other.amount &&
      point == other.point &&
      registeredAt == other.registeredAt &&
      tags == other.tags;

  @override
  int get hashCode =>
      Object.hash(id, title, amount, point, registeredAt,  tags);

  @override
  String toString() {
    return 'CostDaoModel('
        'id: $id, '
        'title: $title, '
        'amount: $amount, '
        'point: $point, '
        'date: $registeredAt, '
        'tags: $tags'
        ')';
  }
}
