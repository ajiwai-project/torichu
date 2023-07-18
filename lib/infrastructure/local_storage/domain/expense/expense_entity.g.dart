// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseEntityAdapter extends TypeAdapter<ExpenseEntity> {
  @override
  final int typeId = 0;

  @override
  ExpenseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseEntity(
      id: fields[0] as String,
      title: fields[1] as String,
      amount: fields[2] as double,
      point: fields[3] as int,
      category: fields[4] as String,
      date: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseEntity obj) {
    writer
      ..writeByte(6)
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
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
