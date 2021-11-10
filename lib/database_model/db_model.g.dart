// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScannedDataAdapter extends TypeAdapter<ScannedData> {
  @override
  final int typeId = 0;

  @override
  ScannedData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScannedData(
      data: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ScannedData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScannedDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
