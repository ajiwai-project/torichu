import 'package:hive_flutter/hive_flutter.dart';

part 'tag_dao_model.g.dart';

@HiveType(typeId: 1)
class TagDaoModel extends HiveObject {
  @HiveField(0)
  String value;

  TagDaoModel({required this.value});

  factory TagDaoModel.of(String value) {
    return TagDaoModel(value: value);
  }

  @override
  bool operator ==(other) => other is TagDaoModel && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'TagDaoModel('
        'value: $value'
        ')';
  }
}
