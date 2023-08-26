import 'package:flutter_template/infrastructure/local_storage/domain/cost/cost_dao_model.dart';
import 'package:flutter_template/infrastructure/local_storage/domain/cost/tag_dao_model.dart';
import 'package:hive/hive.dart';

class CostDaoModelAdapter extends TypeAdapter<CostDaoModel> {
  @override
  final int typeId = 0;

  @override
  CostDaoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CostDaoModel(
      id: fields[0] as String,
      title: fields[1] as String,
      amount: fields[2] as int,
      point: fields[3] as int,
      category: fields[4] as String,
      registeredAt: fields[5] as String,
      tags: fields[6] != null ? (fields[6] as List).cast<TagDaoModel>() : [],
    );
  }

  @override
  void write(BinaryWriter writer, CostDaoModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.point)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.registeredAt)
      ..writeByte(6)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CostDaoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
