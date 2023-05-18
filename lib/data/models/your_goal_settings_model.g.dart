// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'your_goal_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YourGoalSettingsModelAdapter extends TypeAdapter<YourGoalSettingsModel> {
  @override
  final int typeId = 1;

  @override
  YourGoalSettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YourGoalSettingsModel(
      steps: fields[0] as int,
      calories: fields[1] as int,
      distance: fields[2] as int,
      minutes: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, YourGoalSettingsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.steps)
      ..writeByte(1)
      ..write(obj.calories)
      ..writeByte(2)
      ..write(obj.distance)
      ..writeByte(3)
      ..write(obj.minutes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YourGoalSettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
