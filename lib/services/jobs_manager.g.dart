// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_manager.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobsManagerAdapter extends TypeAdapter<JobsManager> {
  @override
  final int typeId = 1;

  @override
  JobsManager read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobsManager()
      .._startTime = fields[0] as DateTime
      .._endTime = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, JobsManager obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._startTime)
      ..writeByte(1)
      ..write(obj._endTime)
      ..writeByte(2)
      ..write(obj.currentJob);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobsManagerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
