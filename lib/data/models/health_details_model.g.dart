// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HealthDetailsModelAdapter extends TypeAdapter<HealthDetailsModel> {
  @override
  final int typeId = 3;

  @override
  HealthDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HealthDetailsModel(
      gender: fields[0] as String,
      weight: fields[1] as int,
      height: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HealthDetailsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HealthDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
