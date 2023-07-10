// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_dao_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

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
      amount: fields[1] as int,
      point: fields[2] as int,
      date: fields[3] as String,
      category: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CostDaoModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.point)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.category);
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
