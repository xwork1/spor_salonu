// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vucut_ekle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BodyModelAdapter extends TypeAdapter<BodyModel> {
  @override
  final int typeId = 1;

  @override
  BodyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BodyModel(
      id: fields[0] as String,
      bolge: fields[1] as String,
      olcu: fields[2] as String,
      hedef: fields[3] as String,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BodyModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bolge)
      ..writeByte(2)
      ..write(obj.olcu)
      ..writeByte(3)
      ..write(obj.hedef)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BodyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
