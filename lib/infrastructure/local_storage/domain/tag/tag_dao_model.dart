import 'package:hive_flutter/hive_flutter.dart';

part 'tag_dao_model.g.dart';

@HiveType(typeId: 1)
class TagDaoModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String value;

  TagDaoModel({required this.id, required this.value});

  factory TagDaoModel.of(String id, String value) {
    return TagDaoModel(id: id, value: value);
  }

  @override
  bool operator ==(other) =>
      other is TagDaoModel && id == other.id && value == other.value;

  @override
  int get hashCode => Object.hash(id, value);

  @override
  String toString() {
    return 'TagDaoModel('
        'id: $id, '
        'value: $value'
        ')';
  }
}
