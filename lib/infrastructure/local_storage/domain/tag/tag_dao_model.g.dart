// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_dao_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TagDaoModelAdapter extends TypeAdapter<TagDaoModel> {
  @override
  final int typeId = 1;

  @override
  TagDaoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TagDaoModel(
      id: fields[0] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TagDaoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagDaoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
