// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_system_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeasurementSystemModelAdapter
    extends TypeAdapter<MeasurementSystemModel> {
  @override
  final int typeId = 2;

  @override
  MeasurementSystemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeasurementSystemModel(
      measurementSystem: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MeasurementSystemModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.measurementSystem);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasurementSystemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
